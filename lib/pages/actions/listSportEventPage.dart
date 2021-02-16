import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_betting_mobile/blocks/events_block.dart';
import 'package:sport_betting_mobile/model/FootballMatch.dart';
import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';
import 'package:sport_betting_mobile/theme.dart';

class ListEventsScreen extends StatefulWidget {

  ListEventsScreen();

  @override
  _ListEventsScreenState createState() => _ListEventsScreenState();
}

class _ListEventsScreenState extends State<ListEventsScreen> {
  final bloc = EventsBlock();

  _ListEventsScreenState();

  @override
  void initState() {
    super.initState();
    bloc.getEvents();
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
          title: Text("Sport Events"),
        ),
        body: Container(
          decoration: new BoxDecoration(color: AppColors.grey_f8),
          child: getListViewEvents(),
        ));
  }

  Widget getProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getListViewEvents() {
    return StreamBuilder(
      stream: bloc.events,
      initialData: bloc.initialData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          EventsResponse eventsResponse = snapshot.data;

          if (eventsResponse.isError()) {
            return getErrorWidget(eventsResponse.errorMessage);
          } else {
            return ListView.builder(
                itemCount: eventsResponse.events.length,
                itemBuilder: (BuildContext context, int index) {
                  EventListItem item = eventsResponse.events[index];

                  if (item is DateItem) {
                    return getDateHeaderWidget(item.date);
                  } else if (item is MatchItem) {
                    return getMatchItemWidget(item.match);
                  }
                  return null;
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

  Widget getMatchItemWidget(FootballMatch match) {
    final score =
        match.match_hometeam_score + " - " + match.match_awayteam_score;

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
                          match.league_name,
                          style: AppTextStyles.leagueName,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            match.match_time,
                            style: AppTextStyles.matchTime,
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
                                    match.match_hometeam_name,
                                    style: AppTextStyles.teamName,
                                  ),
                                ),
                                flex: 1),
                            new Flexible(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 60.0,
                                  child: Text(
                                    score,
                                    style: AppTextStyles.score,
                                  ),
                                ),
                                flex: 1),
                            new Flexible(
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    match.match_awayteam_name,
                                    style: AppTextStyles.teamName,
                                  ),
                                ),
                                flex: 1),
                          ])),
                ]))));
  }
}
