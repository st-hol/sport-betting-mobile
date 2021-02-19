import 'package:flutter/material.dart';
import 'package:sport_betting_mobile/blocks/bet_coefficients_block.dart';
import 'package:sport_betting_mobile/model/BetCoefficient.dart';
import 'package:sport_betting_mobile/model/payload/BetCoefficientsResponse.dart';

import '../../theme.dart';

class SeeBetCoefficientsScreen extends StatefulWidget {
  SeeBetCoefficientsScreen();

  @override
  _SeeBetCoefficientsScreen createState() => _SeeBetCoefficientsScreen();
}

class _SeeBetCoefficientsScreen extends State<SeeBetCoefficientsScreen> {
  final bloc = SeeBetCoefficientsBlock();

  _SeeBetCoefficientsScreen();

  @override
  void initState() {
    super.initState();
    bloc.getBetCoeffs();
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
          title: Text("Bet Coefficients"),
        ),
        body: Container(
          decoration: new BoxDecoration(color: AppColors.grey_f8),
          child: getListViewCoefficients(),
        ));
  }

  Widget getProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getListViewCoefficients() {
    return StreamBuilder(
      stream: bloc.coeffs,
      initialData: bloc.initialData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          BetCoefficientsResponse response = snapshot.data;

          if (response.isError()) {
            return getErrorWidget(response.errorMessage);
          } else {
            return ListView.builder(
                itemCount: response.betCoeffs.length,
                itemBuilder: (BuildContext context, int index) {
                  BetCoefficientItem item = response.betCoeffs[index];

                  return _getBetCoeffItemWidget(item.betCoeff);
                });
          }
        }
      },
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

  Widget _getBetCoeffItemWidget(BetCoefficient bc) {
    final line = bc.name + "    |    " + bc.coefficient;

    return Container(
        margin: const EdgeInsets.only(
            left: 3.0, top: 6.0, right: 3.0, bottom: 6.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(4.0),
        ),
        child: Container(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 3.0, top: 8.0, right: 3.0, bottom: 16.0),
                child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Flexible(
                                child: Container(
                                  alignment: Alignment.center,
                                  // width: 60.0,
                                  child: Text(
                                    line,
                                    style: AppTextStyles.score,
                                  ),
                                ),
                                flex: 1),
                          ])),
                ]))));
  }
}
