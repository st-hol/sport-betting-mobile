import 'package:flutter/material.dart';

class PopulateDrawer {
  static Drawer populateDrawer(BuildContext context) {
    Drawer drawer = Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            accountName: Text("Abass Makinde"),
            accountEmail: Text("abs@gmail.com"),
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
                Navigator.popAndPushNamed(context, "/home");
              },
              leading: Icon(Icons.home, color: Colors.pink),
              title: Text("Home Page"),
            ),
          ),
          InkWell(
            onTap: null,
            child: ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/profile");
              },
              leading: Icon(Icons.person, color: Colors.black),
              title: Text("My Profile"),
            ),
          ),
          InkWell(
            onTap: null,
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/news");
              },
              leading: Icon(Icons.shopping_basket, color: Colors.red),
              title: Text("News"),
            ),
          ),
          Divider(),
          InkWell(
            onTap: null,
            child: ListTile(
              leading: Icon(Icons.help, color: Colors.green),
              title: Text("About"),
            ),
          ),
          InkWell(
            onTap: null,
            child: ListTile(
              leading: Icon(
                Icons.power_settings_new,
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
