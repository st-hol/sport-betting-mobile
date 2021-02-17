import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_betting_mobile/notifier/AccountInfoHolder.dart';
import './routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AccountInfoHolder>(
              create: (context) => AccountInfoHolder()),
        ],
        child: Consumer<AccountInfoHolder>(
            builder: (context, provider, child) => MaterialApp(
                  theme: ThemeData(
                    primarySwatch: Colors.pink,
                  ),
                  title: 'sport-betting-mobile',
                  debugShowCheckedModeBanner: false,
                  //home: LandingPage(),
                  initialRoute: '/',
                  onGenerateRoute: RouteGenerator.generateRoute,
                )));
  }
}
