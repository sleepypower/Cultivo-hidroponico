import 'package:cultivo_hidroponico/Data/Models/user_model.dart';
import 'package:cultivo_hidroponico/Domain/UseCase/authentication.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final _internalStorage = new FlutterSecureStorage();
  var database = LocalDataSource();
  var _loading = false.obs;
  var _currentUser = User(mail: "", firstName: "", lastName: "", password: "").obs;

  Future<void> currentUserName() async {
    _currentUser.value = await database.getUserInfo(_currentUser.value.mail);
  }

  User get currentUser  {
    return _currentUser.value;
  }

  bool get loading {
    return _loading.value;
  }

  set loading(bool newVal) {
    _loading.value = newVal;
  }

  Future<void> updateCurrentUser(String mail) async {
    User newUser = await database.getUserInfo(mail);
    _currentUser.update((user) {
      user!.mail = newUser.mail;
      user.firstName = newUser.firstName;
      user.lastName = newUser.lastName;
    });
  }

  Future<bool> login(User user) async {
    // check if user is in memory

    _loading.value = true;
    await Future.delayed(Duration(seconds: 1));
    bool loggedIn = await database.logUser(user);
    print("loggedIn value: ${loggedIn}");
    if (loggedIn)
      {
        await updateCurrentUser(user.mail);

        /*await _internalStorage.write(key: "logged", value: "true");
        await _internalStorage.write(key: "mail", value: "true");*/
      }
    //print("Memory usermail ${localMail}, user signUp mail $mail, ${(localMail == mail)}");
    _loading.value = false;
    return loggedIn;
  }

  Future<bool> signUp(User user) async {
    _loading.value = true;
    print(_loading.value);
    //await _internalStorage.write(key: "logged", value: "false");

    bool signedUp = await database.signUser(user);

    if (!signedUp) {
      _loading.value = false;
      return Future.value(false);
    }
    // Keep the user logged
    /*await _internalStorage.write(key: "logged", value: "true");
    await _internalStorage.write(key: "firstName", value: user.firstName);
    await _internalStorage.write(key: "lastName", value: user.lastName);
    await _internalStorage.write(key: "mail", value: user.mail);
    await _internalStorage.write(key: "password", value: user.password);*/

    _loading.value = false;
    return Future.value(true);
  }
}
