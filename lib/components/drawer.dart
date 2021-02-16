import 'package:flutter/material.dart';

class PopulateDrawer {
  static Drawer populateDrawer(BuildContext context) {
    Drawer drawer = Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            accountName: Text("Stanislav"),
            accountEmail: Text("st-hol@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                child: Text(
                  "AM",
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
            onTap:() {},
            child: ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/wagers");
              },
              leading: Icon(Icons.description, color: Colors.black),
              title: Text("My wagers"),
            ),
          ),
          InkWell(
            onTap:() {},
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
            onTap:() {
              Navigator.pushNamed(context, "/coefficients");
            },
            child: ListTile(
              leading: Icon(Icons.help, color: Colors.green),
              title: Text("About coefficients"),
            ),
          ),
          InkWell(
            onTap:() {},
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
