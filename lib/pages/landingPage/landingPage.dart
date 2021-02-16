import 'package:flutter/material.dart';
import 'file:///D:/TEMP/study/mob-titenko-2/proj/sport-betting-mobile/lib/api/AccountApi.dart';
import 'package:sport_betting_mobile/components/drawer.dart';

class LandingScreen extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,//Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 100,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.pushNamed(context, '/login'),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.redAccent, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: Center(
            child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/homepagepic.jpg',
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                Container(
                  child: Text(
                    'Sports Betting App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                SizedBox(
                  height: 255.0,
                  child: Image.asset(
                    "assets/applogo2.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, top: 50),
                )
              ],
            ),
          ),
        )));
  }
}
