import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_betting_mobile/blocks/wagers_block.dart';
import 'package:sport_betting_mobile/model/SportEvent.dart';
import 'package:sport_betting_mobile/model/Wager.dart';
import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';
import 'package:sport_betting_mobile/model/payload/WagersResponse.dart';
import 'package:sport_betting_mobile/theme.dart';

class ListWagersScreen extends StatefulWidget {
  ListWagersScreen();

  @override
  _ListWagersScreenState createState() => _ListWagersScreenState();
}

class _ListWagersScreenState extends State<ListWagersScreen> {
  final bloc = WagersBlock();

  _ListWagersScreenState();

  @override
  void initState() {
    super.initState();
    bloc.getWagers();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wagers"),
        ),
        body: Container(
          decoration: new BoxDecoration(color: AppColors.grey_f8),
          child: getListViewWagers(),
        ));
  }

  Widget getProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getListViewWagers() {
    return StreamBuilder(
      stream: bloc.wagers,
      initialData: bloc.initialData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          WagersResponse response = snapshot.data;

          if (response.isError()) {
            return getErrorWidget(response.errorMessage);
          } else {
            return ListView.builder(
                itemCount: response.wagers.length,
                itemBuilder: (BuildContext context, int index) {
                  WagerItem item = response.wagers[index];
                  return _getWagerItemWidget(item.wager);
                });
          }
        }
      },
    );
  }

  Widget getDateHeaderWidget(String date) {
    return Container(
      margin:
          const EdgeInsets.only(left: 32.0, top: 6.0, right: 16.0, bottom: 6.0),
      child: Text(
        new DateFormat.yMMMd().format(DateTime.parse(date)),
        style: AppTextStyles.listDate,
      ),
    );
  }

  Widget getErrorWidget(String error) {
    return Center(
      child: Text(
        error,
        style: new TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _getWagerItemWidget(Wager wager) {
    final amount = (wager.wager_amount ?? "0") + " points";

    return Container(
        margin: const EdgeInsets.only(
            left: 16.0, top: 6.0, right: 16.0, bottom: 6.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(4.0),
        ),
        child: Container(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 8.0, right: 10.0, bottom: 12.0),
                child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          wager.event_title ?? "TITLE",
                          style: TextStyle(
                            color: Colors.purple
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            wager.creation_time ?? "TIME",
                            style: AppTextStyles.leagueName,
                          ),
                        ),
                      ]),
                  Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Flexible(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  width: double.infinity,
                                  child: Text(
                                    wager.bet_type ?? "BET TYPE",
                                    style: AppTextStyles.teamName,
                                  ),
                                ),
                                flex: 1),
                            new Flexible(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100.0,
                                  child: Text(
                                    amount,
                                    style: AppTextStyles.score,
                                  ),
                                ),
                                flex: 1),
                            new Flexible(
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    wager.sport_type ?? "SPORT TYPE",
                                    style: AppTextStyles.teamName,
                                  ),
                                ),
                                flex: 1),
                          ])),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Outcome is [" + (wager.outcome ?? "TITLE") + "]",
                          style: TextStyle(
                              color: Colors.purple
                          ),
                        ),
                      ]),
                ]))));
  }
}
