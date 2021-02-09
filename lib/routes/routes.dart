import 'package:flutter/material.dart';
import 'package:sport_betting_mobile/pages/splashScreen/splashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
