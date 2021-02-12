import 'package:flutter/material.dart';
import 'package:sport_betting_mobile/pages/landingPage/landingPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool started = false;
  @override
  void initState() {
    changeScreen();
  }

  changeScreen() async {
    await Future.delayed(new Duration(seconds: 3));
    setState(() {
      started = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (started == true) {
      return LandingScreen();
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/pinkredfon.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Image.asset('assets/applogo2.png'),
        ),
      ),
    );
  }
}
