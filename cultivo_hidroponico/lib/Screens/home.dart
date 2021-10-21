import 'package:cultivo_hidroponico/Config/ScreenAttributes.dart';
import 'package:cultivo_hidroponico/Domain/UseCase/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: SizeConfig.safeBlockVertical! * 88,
            width: SizeConfig.safeBlockHorizontal! * 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //LocalDataSource
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Welcome back,',
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'David',
                              style: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff32B768)),
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Text("") //Todo user Image
                  ],
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Here are the real time details of your crops',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      indicatorItem(
                        indicatorName: "Temperature",
                        icon_data: Icons.thermostat,
                        indicatorValue: "22°",
                        iconColor: Color(0xff606964),
                      ),
                      indicatorItem(
                          indicatorName: "Humidity",
                          icon_data: Icons.water_damage,
                          indicatorValue: "35",
                          iconColor: Color(0xff6ECEFF)),
                    ],
                  ),
                ),
                indicatorItem(
                  indicatorName: "Conductivity",
                  icon_data: Icons.flash_on,
                  indicatorValue: "230",
                  iconColor: Color(0xffFED97A),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      indicatorItem(
                        indicatorName: "pH Level",
                        icon_data: Icons.device_thermostat,
                        indicatorValue: "5.5",
                        iconColor: Color(0xff606964),
                      ),
                      indicatorItem(
                          indicatorName: "Light Level",
                          icon_data: Icons.lightbulb,
                          indicatorValue: "7",
                          iconColor: Color(0xffFED97A)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class indicatorItem extends StatelessWidget {
  final IconData? icon_data;
  String? indicatorName;
  Color? iconColor;
  String? indicatorValue;

  var color = Color(0xff606964);

  indicatorItem(
      {@required this.icon_data,
      @required this.indicatorName,
      this.iconColor = const Color(0xff32B768),
      this.indicatorValue});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Color(0xffF1F3F2),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      icon_data,
                      color: iconColor,
                      size: 50,
                    ),
                    Text(
                      "$indicatorValue",
                      style: GoogleFonts.roboto(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: color),
                    )
                  ],
                ),
                Text(
                  "${this.indicatorName}",
                  style: GoogleFonts.roboto(
                      fontSize: 22, fontWeight: FontWeight.bold, color: color),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
