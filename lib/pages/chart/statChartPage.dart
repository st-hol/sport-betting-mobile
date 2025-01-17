import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sport_betting_mobile/api/WagerApi.dart';
import 'package:sport_betting_mobile/blocks/wagers_block.dart';
import 'package:sport_betting_mobile/model/Wager.dart';
import 'package:sport_betting_mobile/model/payload/WagersResponse.dart';

class StatisticBarChartScreen extends StatefulWidget {
  final WagerService wagerService = WagerService();
  StatisticBarChartScreen();


  @override
  _StatisticBarChartScreenState createState() => _StatisticBarChartScreenState(
      animate:true
  );
}

class _StatisticBarChartScreenState extends State<StatisticBarChartScreen> {
  List<charts.Series> seriesList;
  final bool animate;

  final bloc = WagersBlock();

  _StatisticBarChartScreenState({this.animate});

  @override
  void initState() {
    super.initState();
    bloc.getWagers();
  }


  Widget build(BuildContext context) {

    double textContHeight = 140;
    double paddingTop = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistic chart"),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  left: .0, top: 20.0, right: .0, bottom: 0),
              child: Container(
                height: textContHeight,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Center(
                        child: new Text(
                          'Graph show total points wasted for all time...',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 17.0),
                        ),
                      ),
                      new Spacer(),
                      // new Center(
                      //   child: new Text(
                      //     'This chart shows how much money you could have wasted on betting in real life.',
                      //     textAlign: TextAlign.center,
                      //     style: new TextStyle(
                      //         color: hexToColor("#F2A03D"), fontSize: 17.0),
                      //   ),
                      // ),
                      new Center(
                        child: new Text(
                          'Please do not waste real money on sport! '
                          'It causes addiction.'
                          ' We encourage users not to do that!',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: hexToColor("#F2A03D"),
                              fontSize: 17.0),
                        ),
                      ),
                      new Spacer(),
                      new Center(
                        child: new Text(
                          'Remember: its better to waste POINTS in this app\n'
                              'instead of wasting REAL money in your life!',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                              fontSize: 17.0),
                        ),
                      ),
                    ]),
              )),
          StreamBuilder(
            stream: bloc.wagers,
            initialData: bloc.initialData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {

                List <WagerDateToAmountData> globalData = [];

                WagersResponse wagerReps = snapshot.data;
                wagerReps.wagers.forEach((wagerListItem) {
                  WagerItem wagerItem = wagerListItem as WagerItem;
                  Wager wager = wagerItem.wager;
                  int wagerAmount = double.parse(wager.wager_amount).round();
                  globalData.add(new WagerDateToAmountData(
                      wager.creation_time.substring(0, 10) + "\n" + wager.creation_time.substring(11),
                      wagerAmount));
                });

                List<charts.Series<WagerDateToAmountData, String>> wagerSeriesList;
                wagerSeriesList = [
                  new charts.Series<WagerDateToAmountData, String>(
                    id: 'Id',
                    colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
                    domainFn: (WagerDateToAmountData wagerData, _) => wagerData.date,
                    measureFn: (WagerDateToAmountData wagerData, _) => wagerData.amount,
                    data: globalData,
                  ),
                ];

                return Padding(
                  padding: const EdgeInsets.only(
                      left: .0, top: 20.0, right: .0, bottom: 0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height -
                          textContHeight -
                          paddingTop -
                          100,
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                              // width: double.infinity,
                              // height: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: <Color>[
                                    Colors.pinkAccent,
                                    Colors.purpleAccent
                                  ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                              child: buildChart(context, wagerSeriesList, true)),
                        ],
                      )),
                );
              }
            },
          ),
        ],
      ),
    );
  }


  Widget buildChart(BuildContext context, List<charts.Series> seriesList, bool animate){
    charts.BarChart chart = new charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 6, // size in Pts.
                  color: charts.MaterialPalette.white),
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 10, color: charts.MaterialPalette.white),
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),
    );
    return chart;
  }
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}


class WagerDateToAmountData {
  final String date;
  final int amount;

  WagerDateToAmountData(this.date, this.amount);
}
