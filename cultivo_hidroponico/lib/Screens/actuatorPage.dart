import 'package:cultivo_hidroponico/Config/ScreenAttributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActuatorPage extends StatelessWidget {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
            height: SizeConfig.safeBlockVertical! * 88,
            width: SizeConfig.safeBlockHorizontal! * 90,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 3,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Actuators",
                    style: GoogleFonts.roboto(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff606964)),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 3,
                ),

                Container(
                    width: double.infinity,
                    height: SizeConfig.safeBlockVertical! * 15,
                    decoration: BoxDecoration(
                        color: Color(0xffCCE9F6),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Icon(Icons.flash_on, color: Color(0xff606964)),
                              height: SizeConfig.safeBlockVertical! * 5,
                              width: SizeConfig.safeBlockVertical! * 5,
                              decoration: BoxDecoration(
                                color: Color(0xff6ECEFF),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              "Water valve",
                              style: GoogleFonts.roboto(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff606964)),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        Text("Todo Button")
                      ],
                    )),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 3,
                ),
                Container(
                    width: double.infinity,
                    height: SizeConfig.safeBlockVertical! * 15,
                    decoration: BoxDecoration(
                        color: Color(0xffFFF59E),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Icon(Icons.lightbulb, color: Color(0xff606964)),
                              height: SizeConfig.safeBlockVertical! * 5,
                              width: SizeConfig.safeBlockVertical! * 5,
                              decoration: BoxDecoration(
                                color: Color(0xffFED97A),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              "Light switch",
                              style: GoogleFonts.roboto(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff606964)),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        Text("Todo Button")
                      ],
                    )),

              ],
            )),
      ),
    ));
  }
}
