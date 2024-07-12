import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_to_h/screens/list.dart';

class splash_screen1 extends StatefulWidget {
  const splash_screen1({super.key});

  @override
  State<splash_screen1> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TeamListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0077FF),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Image.asset('assets/recordcircle_up.png')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Image.asset('assets/recordcircle.png')],
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/basket.png',height: 250,),
                  Text(
                    'Basketball',
                    style: GoogleFonts.brunoAceSc(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  SpinKitThreeBounce(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Made for',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Happy To',
                      style: TextStyle(
                          color: Color(0xffF8A401),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                          color: Color(0xffF8A401),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
