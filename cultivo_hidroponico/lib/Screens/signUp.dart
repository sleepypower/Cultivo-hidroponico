import 'package:cultivo_hidroponico/Config/ScreenAttributes.dart';
import 'package:cultivo_hidroponico/Data/Models/user_model.dart';
import 'package:cultivo_hidroponico/Domain/Controllers/AuthenticationController.dart';
import 'package:cultivo_hidroponico/Widgets/roundedTextInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _userEmailController = TextEditingController();

  var _userPasswordController = TextEditingController();

  var _userFirstNameController = TextEditingController();

  var _userLastNameController = TextEditingController();

  bool showPassword = false;

  AuthenticationController authenticationController = Get.find();

  final _formKey = GlobalKey<FormState>();

  bool _mailTaken = false;
  String _mailTakenResponse = "";

  Future<void> _verifyEmail(String mail) async {
    UserModel user = UserModel(mail: mail, firstName: "", lastName: "", password: "");
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
                        height: SizeConfig.blockSizeVertical! * 72,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xFF707070)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        return _mailTakenResponse != ""
                                            ? _mailTakenResponse
                                            : null;
                                      }
                                    }),
                                Container(
                                    decoration: BoxDecoration(),
                                    child: SizedBox(
                                        width:
                                            SizeConfig.blockSizeVertical! * 27,
                                        child: TextFormField(
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          controller: _userPasswordController,
                                          obscureText: !showPassword,
                                          decoration: InputDecoration(
                                              counterText: '',
                                              hintText: "Password",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              filled: true,
                                              hintStyle: TextStyle(
                                                  color: Color(0xFF808080)),
                                              //floatingLabelBehavior: FloatingLabelBehavior.always,
                                              fillColor: Colors.white70,
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    // Update the state i.e. toogle the state of passwordVisible variable
                                                    setState(() {
                                                      showPassword = !showPassword;
                                                    });
                                                  },
                                                  icon: Icon(showPassword
                                                      ? Icons.visibility
                                                      : Icons.visibility_off))),
                                          validator: (value) {
                                            if (value!.length < 6) {
                                              return "Password length must be longer than 6 characters";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ))),
                                GestureDetector(
                                  key: Key('signUpSubmit'),
                                  onTap: () async {
                                    // Dismiss the keyboard
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    authenticationController.loading = true;
                                    await Future.delayed(Duration(seconds: 1));

                                    final form = _formKey.currentState;
                                    form!.save();
                                    setState() {}
                                    ;
                                    await _verifyEmail(
                                        _userEmailController.text);

                                    if (form.validate()) {
                                      UserModel user = UserModel(
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
                                      if (successfulSignUp) {
                                        Get.offAllNamed("/LogIn");
                                      }
                                    }
                                    authenticationController.loading = false;
                                  },
                                  child: GetX<AuthenticationController>(
                                      builder: (authController) {
                                    print(
                                        "Auth val is ${authController.loading}");
                                    String buttonText = "JOIN";

                                    if (authController.loading) {
                                      buttonText = "";
                                    } else {
                                      buttonText = "Join";
                                    }
                                    return SizedBox(
                                      width: SizeConfig.blockSizeVertical! * 17,
                                      height: SizeConfig.blockSizeVertical! * 5,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff32B768),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Center(
                                              child: authController.loading
                                                  ? SizedBox(
                                                      height: SizeConfig
                                                              .blockSizeVertical! *
                                                          3,
                                                      width: SizeConfig
                                                              .blockSizeVertical! *
                                                          3,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                        strokeWidth: 2,
                                                      ),
                                                    )
                                                  : Text(
                                                      "Join",
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ))),
                                    );
                                  }),
                                )
                              ],
                            ),
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
