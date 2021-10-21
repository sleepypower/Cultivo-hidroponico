import 'package:cultivo_hidroponico/Config/ScreenAttributes.dart';
import 'package:cultivo_hidroponico/Data/Models/user_model.dart';
import 'package:cultivo_hidroponico/Domain/Controllers/AuthenticationController.dart';
import 'package:cultivo_hidroponico/Widgets/roundedTextInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _userEmailController = TextEditingController();

  var _userPasswordController = TextEditingController();

  var _userFirstNameController = TextEditingController();

  var _userLastNameController = TextEditingController();

  AuthenticationController authenticationController = Get.find();

  final _formKey = GlobalKey<FormState>();

  bool _mailTaken = false;
  String _mailTakenResponse = "";

  Future<void> _verifyEmail(String mail) async {
    User user = User(mail: mail, firstName: "", lastName: "", password: "");
    await Future.delayed(Duration(seconds: 5));
    bool exists = await authenticationController.database.checkUserExists(user);
    if (exists) {
      _mailTaken = true;
      _mailTakenResponse = "This mail is taken. Try another.";
    } else {
      _mailTaken = false;
      _mailTakenResponse = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff32B768),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical! * 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 5,
                        height: 0,
                      ),
                      GestureDetector(
                        child: Text(
                          '< Go back',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 4,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 72,
                        height: SizeConfig.blockSizeVertical! * 70,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xFF707070)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 1,
                              ),
                              Text(
                                'Sign Up',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E2D2D),
                                  fontSize: 35,
                                ),
                              ),
                              TextRoundedForm(
                                  text: "First Name",
                                  maxLen: 30,
                                  textController: _userFirstNameController,
                                  key: Key("SignUpName"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a First Name";
                                    } else {
                                      return null;
                                    }
                                  }),
                              TextRoundedForm(
                                  text: "Last Name",
                                  maxLen: 30,
                                  textController: _userLastNameController,
                                  key: Key("SignUpLastName"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a Last Name";
                                    } else {
                                      return null;
                                    }
                                  }),
                              TextRoundedForm(
                                  text: "Email",
                                  textController: _userEmailController,
                                  key: Key("loginMailText"),
                                  validator: (value) {
                                    if (!value!.contains("@")) {
                                      return "Please enter a valid email";
                                    } else {
                                      return _mailTakenResponse != "" ? _mailTakenResponse : null;
                                    }
                                  }),
                              TextRoundedForm(
                                  text: "Password",
                                  textController: _userPasswordController,
                                  key: Key("loginPasswordText"),
                                  validator: (value) {
                                    if (value!.length < 6) {
                                      return "Password length must be longer than 6 characters";
                                    } else {
                                      return null;
                                    }
                                  }),
                              GetX<AuthenticationController>(
                                  builder: (authController) {
                                print("Auth val is ${authController.loading}");
                                String buttonText = "JOIN";

                                if (authController.loading) {
                                  buttonText = "";
                                } else {
                                  buttonText = "Join";
                                }
                                return ElevatedButton.icon(
                                  key: Key('signUpSubmit'),
                                  onPressed: () async {
                                    // Dismiss the keyboard
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    authController.loading = true;

                                    final form = _formKey.currentState;
                                    form!.save();

                                    await _verifyEmail(
                                        _userEmailController.text);
                                    print("not validated yet!");
                                    if (form.validate()) {
                                      print("validated!");
                                      User user = User(
                                          mail: _userEmailController.text,
                                          firstName:
                                              _userFirstNameController.text,
                                          lastName:
                                              _userLastNameController.text,
                                          password:
                                              _userPasswordController.text);
                                      bool successfulSignUp =
                                          await authController
                                              .signUp(user);
                                      await authController.database
                                          .checkUserExists(user);
                                      if (successfulSignUp) {
                                        Get.offAllNamed("/LogIn");
                                      }
                                    }
                                    authController.loading = false;
                                  },
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                      padding: MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.fromLTRB(40, 12, 40, 12)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xff32B768)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  color: Color(0xff32B768))))),
                                  icon: authController.loading
                                      ? Container(
                                          width: 24,
                                          height: 24,
                                          padding: const EdgeInsets.all(2.0),
                                          child:
                                              const CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 3,
                                          ),
                                        )
                                      : const Icon(null),
                                  label: Text('$buttonText'),
                                );
                              }),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 1,
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
TextButton(
key: Key('signUpSubmit'),
child: Text("Join".toUpperCase(),
style: TextStyle(
fontSize: 14, color: Colors.white)),
style: ButtonStyle(
overlayColor:
MaterialStateProperty.all<Color>(
Colors.transparent),
padding: MaterialStateProperty.all<
    EdgeInsets>(
EdgeInsets.fromLTRB(40, 12, 40, 12)),
backgroundColor:
MaterialStateProperty.all<Color>(
Color(0xff32B768)),
shape: MaterialStateProperty.all<
    RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(10.0),
side: BorderSide(
color: Color(0xff32B768))))),
onPressed: () async {
// Dismiss the keyboard
FocusScope.of(context)
.requestFocus(FocusNode());

final form = _formKey.currentState;
form!.save();


await _verifyEmail(
_userEmailController.text);


if (form.validate()) {
User user = User(
mail: _userEmailController.text,
firstName:
_userFirstNameController.text,
lastName:
_userLastNameController.text,
password:
_userPasswordController.text);
bool successfulSignUp =
await authenticationController
    .signUp(user);
await authenticationController.database
    .checkUserExists(user);
*/
/*if (successfulSignUp) {
                                        Get.offAllNamed("/LogIn");
                                      }*/ /*

}
}),*/
