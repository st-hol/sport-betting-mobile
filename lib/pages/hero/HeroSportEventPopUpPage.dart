import 'package:flutter/material.dart';
import 'package:sport_betting_mobile/api/BetApi.dart';
import 'package:sport_betting_mobile/model/SportEvent.dart';

class HeroSportEventPopUpPage extends StatelessWidget {
  final String tagIdSportEvent;
  final SportEvent sportEvent;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final BetService betService = new BetService();

  final firstTeamFieldController = TextEditingController();
  final secondTeamFieldController = TextEditingController();
  final amountFieldController = TextEditingController();

  HeroSportEventPopUpPage(this.tagIdSportEvent, this.sportEvent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(sportEvent.title),
      ),
      body: Hero(
        tag: '$tagIdSportEvent',
        child: Scaffold(
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
                          gradient: LinearGradient(colors: <Color>[
                        Colors.redAccent,
                        Colors.blueAccent
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
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
                                  controller: firstTeamFieldController,
                                  decoration: InputDecoration(
                                    hintText: "Home team score",
                                    icon: Icon(Icons.filter_1),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                ),
                                TextField(
                                  controller: secondTeamFieldController,
                                  decoration: InputDecoration(
                                    hintText: "Away team score",
                                    icon: Icon(Icons.filter_2),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                ),
                                TextField(
                                  controller: amountFieldController,
                                  decoration: InputDecoration(
                                    hintText: "Amount",
                                    icon: Icon(Icons.attach_money),
                                  ),
                                ),
                                Container(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60))),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60)),
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
        ),
      ),
    );
  }

  void _changeInfo(BuildContext context) async {
    print("attempt change info");
    bool result = await betService.makeBet(
        context,
        firstTeamFieldController.text,
        secondTeamFieldController.text,
        amountFieldController.text,
        sportEvent);

    String message;
    if (result == true) {
      message = "Success";
    } else {
      message = "Failure";
    }
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Hide',
        onPressed: () {},
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _backToCabinet(BuildContext context) {
    print("back to cabinet");
    Navigator.pushNamed(context, '/cabinet');
  }
}
