import 'package:cultivo_hidroponico/Config/ScreenAttributes.dart';
import 'package:cultivo_hidroponico/Data/Models/user_model.dart';
import 'package:cultivo_hidroponico/Domain/Controllers/AuthenticationController.dart';
import 'package:cultivo_hidroponico/Widgets/roundedTextInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var _userEmailController = TextEditingController();

  var _userPasswordController = TextEditingController();

  final authController = Get.find<AuthenticationController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(//clipBehavior: Clip.antiAlias,
            children: [
          Positioned(
            top: -(SizeConfig.blockSizeVertical! * 30) / 2,
            left: -(SizeConfig.blockSizeHorizontal! * 70) / 2,
            child: Container(
              height: SizeConfig.blockSizeHorizontal! * 90,
              width: SizeConfig.blockSizeHorizontal! * 90,
              decoration: BoxDecoration(
                  color: Color(0xff32B768), shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: -(SizeConfig.blockSizeVertical! * 30) / 2,
            right: -(SizeConfig.blockSizeHorizontal! * 70) / 2,
            child: Container(
              height: SizeConfig.blockSizeHorizontal! * 85,
              width: SizeConfig.blockSizeHorizontal! * 85,
              decoration: BoxDecoration(
                  color: Color(0xff32B768), shape: BoxShape.circle),
            ),
          ),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: SizeConfig.blockSizeVertical! * 7,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 7,
                                height: 0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.local_florist_sharp,
                                    size: 40,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Croppy',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 35,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 72,
                                height: SizeConfig.blockSizeVertical! * 67,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Color(0xFF707070)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical! * 5,
                                      ),
                                      Text(
                                        'Log In',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2E2D2D),
                                          fontSize: 35,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical! * 5,
                                      ),
                                      TextRoundedForm(
                                        text: "Email",
                                        textController: _userEmailController,
                                        key: Key("loginMailText"),
                                        validator: (value) {
                                          if (!value!.contains("@")) {
                                            return "Please enter a valid email";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical! * 5,
                                      ),
                                      TextRoundedForm(
                                          text: "Password",
                                          maxLen: 0,
                                          textController:
                                              _userPasswordController,
                                          key: Key("loginPasswordText"),
                                          validator: (value) {
                                            if (value!.length < 6) {
                                              return "Password length must be longer than 6 characters";
                                            } else {
                                              return null;
                                            }
                                          }),
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical! * 2.5,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Olvidaste tu Contraseña?',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF808080),
                                            fontSize: 13,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical! * 1.5,
                                      ),
                                      TextButton(
                                          key: Key('loginSubmit'),
                                          child: Text("Join".toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                          style: ButtonStyle(
                                              overlayColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.transparent),
                                              padding: MaterialStateProperty.all<EdgeInsets>(
                                                  EdgeInsets.all(15)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Color(0xff32B768)),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(30.0),
                                                      side: BorderSide(color: Color(0xff32B768))))),
                                          onPressed: () async {
                                            // Dismiss the keyboard
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());

                                            final form = _formKey.currentState;
                                            form!.save();
                                            if (form.validate()) {
                                              User user = User(
                                                  mail:
                                                      _userEmailController.text,
                                                  firstName: "",
                                                  lastName: "",
                                                  password:
                                                      _userPasswordController
                                                          .text);
                                              bool logged = await authController
                                                  .login(user);
                                              if (logged) {
                                                Get.off(Dashboard());
                                              }
                                            }
                                          }),
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical! * 1.5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.toNamed("/SignUp");
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Eres nuevo aquí? ',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF808080),
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              'Unete',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xff32B768),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                        ),
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
