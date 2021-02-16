import "package:flutter/material.dart";
import 'package:sport_betting_mobile/api/AccountApi.dart';

class LoginScreen extends StatefulWidget {
  final AccountService accountService = AccountService();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final loginFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  @override
  void dispose() {
    loginFieldController.dispose();
    passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: new Stack(
              children: <Widget>[
                new Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Colors.redAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: new Center(
                    child: new Icon(
                      Icons.lock_outline,
                      size: 40,
                    ),
                  ),
                ),
                new ListView(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(top: 100),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Column(
                          children: <Widget>[
                            Container(
                              height: 40,
                            ),
                            TextField(
                              controller: loginFieldController,
                              decoration: InputDecoration(
                                hintText: "login",
                                icon: Icon(Icons.person_outline),
                              ),
                            ),
                            Container(
                              height: 40,
                            ),
                            TextField(
                              controller: passwordFieldController,
                              decoration: InputDecoration(
                                hintText: "password",
                                icon: Icon(Icons.lock_outline),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                _attemptLogin(context);
                              },
                              child: new Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60))),
                                child: Center(
                                    child: new Text(
                                  "submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            new SizedBox(
                              height: 10,
                            ),
                            // new Text(""),
                            new SizedBox(
                              height: 40,
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                  ),
                                  child: new Center(
                                    child: InkWell(
                                        onTap: () {
                                          _backToLanding(context);
                                        },
                                        child: new Icon(
                                          Icons.arrow_downward,
                                          color: Colors.grey[700],
                                        )),
                                  ),
                                ),
                                new SizedBox()
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  void _attemptLogin(BuildContext context) async {
    print("attempt log in");
    String login = loginFieldController.text;
    String password= passwordFieldController.text;
    bool success = await widget.accountService.processLoginRequest(login, password);
    if (success) {
      Navigator.pushNamed(context, '/cabinet');
      print("login success");
    } else {
      print("login failed");
      //finally in the topmost code use this key in the following way
      final snackBar = SnackBar(
        content: Text('Login attempt failed!'),
        action: SnackBarAction(
          label: 'Hide',
          onPressed: () {},
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  void _backToLanding(BuildContext context) {
    print("back to landing");
    Navigator.pushNamed(context, '/');
  }

}
