import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final _internalStorage = new FlutterSecureStorage();

  Future<String> get logged async {
    return await _internalStorage.read(key: "logged") ?? "";
  }

  Future<bool> login(user, password) async {
    // Check if user and password are not empty
    if (user == "" || password == "") {
      return Future.value(false);
    }

    // Get user in memory
    String localUser = await _internalStorage.read(key: "email") ?? "";
    String localPassword = await _internalStorage.read(key: "password") ?? "";

    // check if input user matches with the one in memory
    if (localUser == user && localPassword == password) {
      await _internalStorage.write(key: "logged", value: "true");
      return Future.value(true);
    } else {
      await _internalStorage.write(key: "logged", value: "false");
      return Future.value(false);
    }
  }

  Future<bool> signUp(mail, firstName, lastName, password) async {
    // Change this when the real database is available

    // Get user in memory
    String localUserMail = await _internalStorage.read(key: "email") ?? "";
    //print("Memory usermail ${mail}, user signUp mail $localUserMail, ${(localUserMail == mail)}");
    // Ensure if the user is not the same as the one in memory
    if (localUserMail == mail) {
      await _internalStorage.write(key: "logged", value: "false");
      return Future.value(false);
    }

    await _internalStorage.write(key: "firstName", value: firstName);
    await _internalStorage.write(key: "lastName", value: lastName);
    await _internalStorage.write(key: "mail", value: mail);
    await _internalStorage.write(key: "password", value: password);

    return Future.value(true);

  }

}