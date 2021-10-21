import 'package:cultivo_hidroponico/Data/Models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class LocalDataSource {
  Database? _database;
  String _mail = "";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'crop_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Users (mail varchar, first_name varchar(30) not null, last_name varchar(30) not null, password varchar(30) not null, primary key (mail))');
    await db.execute(
        'CREATE TABLE Condition (id serial, condition_name varchar not null unique, primary key (id))');
    await db.execute(
        'CREATE TABLE Sensor(id serial, id_condition, primary key (id), foreign key (id_condition) references Condition(id))');
    await db.execute(
        'CREATE TABLE Sensor_data(time date, temperature double,humidity double,conductivity double,ph double,light_level double,id_sensor, mail_user,primary key (time, id_sensor),foreign key (id_sensor) references sensor(id),foreign key (mail_user) references Users(mail))');
    await db.execute(
        'CREATE TABLE Users_Sensor(id_sensor, mail_user, foreign key (id_sensor) references sensor(id), foreign key (mail_user) references Users(mail))');
  }

  Future<bool> checkUserExists(User user) async {
    final db = await database;
    try {
      var mailMap = await db
          .rawQuery('SELECT mail FROM Users WHERE mail = ?', [user.mail]);
      print(mailMap);
      return mailMap.isNotEmpty;
    } catch (e) {
      print("checkUserExists Error: Failed to query the data base");
      return true;
    }
  }

  /*Future<void> deleteUser(id) async {
    Database db = await database;
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }*/

  Future<bool> signUser(User user) async {
    if (await checkUserExists(user)) {
      return false;
    }

    try {
      Database db = await database;
      await db.insert('users', user.toMap());
      _mail = user.mail;
      return true;
    } catch (e) {
      print("signUser Error: Couldn't insert new user into database");
      _mail = "";
      return false;
    }
  }

  Future<bool> logUser(User user) async {
    final userExists = await checkUserExists(user);
    if (!userExists) {
      _mail = "";
      return false;
    }

    Database db = await database;
    var userValues;
    try {
      userValues = await db.rawQuery(
          'Select mail, password From Users where mail = ?', [user.mail]);
    } catch (e) {
      print("LogUser Error: Couldn't connect to the data base");
      _mail = "";
      return Future.value(false);
    }

    if (userValues["mail"] == user.mail &&
        userValues["password"] == user.password) {
      _mail = user.mail;
      return Future.value(true);
    }
    _mail = "";
    return Future.value(false);
  }

  Future<String> getCurrentMail() async {
    return _mail;
  }

  Future<User> getUserInfo(String mail) async {
    final db = await database;
    final maps =
        await db.rawQuery("Select * from Users where mail = ?", [mail]);

    User user = User(
        mail: maps[0]['mail'] as String,
        firstName: maps[0]['FirstName'] as String,
        lastName: maps[0]['LastName'] as String,
        password: maps[0]['Password'] as String);
    return user;
  }
}
