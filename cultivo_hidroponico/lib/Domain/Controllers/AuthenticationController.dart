import 'package:cultivo_hidroponico/Data/Models/user_model.dart';
import 'package:cultivo_hidroponico/Domain/UseCase/authentication.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final _internalStorage = new FlutterSecureStorage();
  var h = "Hey".obs;
  var database = LocalDataSource();

  Future<bool> login(User user) async {
    database.getUserInfo("dxaj");

    bool loggedIn = await database.logUser(user);
    /*if (loggedIn)
      {
        await _internalStorage.write(key: "logged", value: "true");
        await _internalStorage.write(key: "mail", value: "true");
      }*/
    //print("Memory usermail ${localMail}, user signUp mail $mail, ${(localMail == mail)}");
    return loggedIn;
  }

  Future<bool> signUp(User user) async {
    //await _internalStorage.write(key: "logged", value: "false");

    bool signedUp = await database.signUser(user);

    if (!signedUp) {
      return Future.value(false);
    }
    // Keep the user logged
    /*await _internalStorage.write(key: "logged", value: "true");
    await _internalStorage.write(key: "firstName", value: user.firstName);
    await _internalStorage.write(key: "lastName", value: user.lastName);
    await _internalStorage.write(key: "mail", value: user.mail);
    await _internalStorage.write(key: "password", value: user.password);*/

    return Future.value(true);
  }
}
