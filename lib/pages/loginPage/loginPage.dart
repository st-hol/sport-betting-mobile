import "package:flutter/material.dart";

// void main() => runApp(new MyApp() );
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "simple login",
//       home: new MainActivity(),
//     );
//   }
// }


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
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
                          colors: <Color>[
                            Colors.redAccent,
                            Colors.blueAccent
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      )
                  ),
                  child: new Center(
                    child: new Icon(Icons.lock_outline,size: 40,),
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
                              topRight: Radius.circular(60)
                          )
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Column(

                          children: <Widget>[
                            Container(height: 40,),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "نام کاربری",
                                icon: Icon(Icons.person_outline),
                              ),
                            ),
                            Container(height: 40,),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "رمز عبور",
                                icon: Icon(Icons.lock_outline),
                              ),
                            ),
                            SizedBox(height: 40,),
                            InkWell(
                              onTap: (){
                                print("ok");
                              },
                              child: new Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.all(Radius.circular(60))
                                ),
                                child: Center(
                                    child: new Text("ورود",
                                      style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold)
                                      ,)
                                ),
                              ),
                            ),
                            new SizedBox(height: 10,),
                            new Text("رمز عبورت رو فرامش کردی؟"),
                            new SizedBox(height: 40,),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(60)
                                    ),
                                  ),
                                  child: new Center(
                                    child: new Icon(
                                      Icons.fingerprint,
                                      color:Colors.grey[700] ,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 50,),
                                new Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100)
                                    ),
                                  ),
                                  child: new Center(
                                    child: new Icon(
                                      Icons.face,
                                      color:Colors.grey[700] ,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}