import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_betting_mobile/api/AccountApi.dart';
import 'package:sport_betting_mobile/notifier/AccountInfoHolder.dart';

class PopulateDrawer {
  static AccountService accountService = AccountService();

  static Drawer populateDrawer(BuildContext context) {
    final model = Provider.of<AccountInfoHolder>(context, listen: false);

    Drawer drawer = Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            accountName: Text(model.name),
            accountEmail: Text(model.email),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                child: Text(
                  (model.name.length > 1 ? model.name.substring(0, 1) : ""),
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/cabinet");
              },
              leading: Icon(Icons.home, color: Colors.pink),
              title: Text("My Cabinet"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/wagers");
              },
              leading: Icon(Icons.description, color: Colors.black),
              title: Text("My wagers"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/events");
              },
              leading: Icon(Icons.attach_money, color: Colors.red),
              title: Text("Bet on events"),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/coefficients");
            },
            child: ListTile(
              leading: Icon(Icons.help, color: Colors.green),
              title: Text("About coefficients"),
            ),
          ),
          InkWell(
            onTap: () {
              accountService.logout(context);
              Navigator.pushNamed(context, "/");
            },
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              title: Text("Log out"),
            ),
          )
        ],
      ),
    );
    return drawer;
  }
}
