import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';

class SensorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      //backgroundColor: Colors.lightBlue,
      body: SafeArea(

        child: Column(

          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              widthFactor: 5.2,
              child: Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                      border: Border.all(
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(child: Text(
                    "Done",
                    style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ))
              ),
            ),
            Container(
              height: 20,
            ),
            Text(
              "Temperature",
              style: GoogleFonts.roboto(
                  fontSize: 38,
                  fontWeight: FontWeight.normal,
                  color: Colors.red),
            ),
            Text(
              "11°",
              style: GoogleFonts.roboto(
                  fontSize: 48,
                  fontWeight: FontWeight.normal,
                  color: Colors.red),
            ),
            Text(
              "11:58 pm",
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.red),
            ),
            Container(
              height: 50,
            ),
            Container(
              height: 400,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Text("Hey")
            )
          ],
        ),
      ),
    );
  }
  
}