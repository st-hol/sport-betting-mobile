import 'package:flutter/material.dart';
import 'package:sport_betting_mobile/pages/actions/betCoefficientsPage.dart';
import 'package:sport_betting_mobile/pages/actions/cabinetPage.dart';
import 'package:sport_betting_mobile/pages/actions/changeInfoPage.dart';
import 'package:sport_betting_mobile/pages/actions/listSportEventPage.dart';
import 'package:sport_betting_mobile/pages/actions/listWagersPage.dart';
import 'package:sport_betting_mobile/pages/chart/statChartPage.dart';
import 'package:sport_betting_mobile/pages/loginPage/loginPage.dart';
import 'package:sport_betting_mobile/pages/splashScreen/splashScreen.dart';

import 'undefinedView.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/cabinet':
        return MaterialPageRoute(builder: (_) => CabinetScreen());
      case '/change-info':
        return MaterialPageRoute(builder: (_) => ChangeInfoScreen());
      case '/events':
        return MaterialPageRoute(builder: (_) => ListEventsScreen());
      case '/wagers':
        return MaterialPageRoute(builder: (_) => ListWagersScreen());
      case '/coefficients':
        return MaterialPageRoute(builder: (_) => SeeBetCoefficientsScreen());
      case '/chart':
        return MaterialPageRoute(
            builder: (_) =>  StatisticBarChartScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => UndefinedView(
                  name: settings.name,
                ));
    }
  }
}
