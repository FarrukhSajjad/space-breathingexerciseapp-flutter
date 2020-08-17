import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space/constant.dart';
import 'package:space/screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Center(
          child: Container(
            color: kBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to',
                  style: kWelcomefontSize,
                ),
                Text(
                  'your  personal',
                  style: kWelcomefontSize,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'SPACE',
                  style:
                      GoogleFonts.amaticSc(fontSize: 100, color: Colors.black),
                ),
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 125.0,
                  backgroundImage: AssetImage(
                    'assets/images/space.jpg',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => HomeScreen()));
                  },
                  child: Icon(
                    Icons.navigate_next,
                    size: 80,
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
