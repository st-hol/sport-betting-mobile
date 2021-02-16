import 'package:flutter/material.dart';
import 'package:sport_betting_mobile/api/AccountApi.dart';


class ChangeInfoScreen extends StatefulWidget {
  final AccountService accountService = AccountService();

  @override
  _ChangeInfoScreenState createState() => _ChangeInfoScreenState();
}

class _ChangeInfoScreenState extends State<ChangeInfoScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Icons.update,
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
                              decoration: InputDecoration(
                                hintText: "e-mail",
                                icon: Icon(Icons.mail_outline),
                              ),
                            ),
                            Container(
                              height: 40,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "first name",
                                icon: Icon(Icons.navigate_next),
                              ),
                            ),
                            Container(
                              height: 40,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "last name",
                                icon: Icon(Icons.navigate_next),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                _changeInfo(context);
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
                                          _backToCabinet(context);
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

  void _changeInfo(BuildContext context) {
    print("attempt change info");
    widget.accountService.changeInfo(context);
  }

  void _backToCabinet(BuildContext context) {
    print("back to cabinet");
    Navigator.pushNamed(context, '/cabinet');
  }
}
