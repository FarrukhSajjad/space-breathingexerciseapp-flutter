import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space/screens/breathing_screen.dart';
import 'package:space/screens/calm_screen.dart';
import 'package:space/screens/home_screen.dart';
import 'package:space/screens/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: OnboardingScreen(),
      routes: {
        '/home-screen': (ctx) => HomeScreen(),
        '/breathing-screen': (ctx) => BreathingScreen(),
        '/getcalm-screen': (ctx) => CalmScreen(),
      },
    );
  }
}
