import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sport_betting_mobile/model/SportEvent.dart';
import 'package:sport_betting_mobile/model/payload/BetCoefficientsResponse.dart';
import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';
import 'package:sport_betting_mobile/model/payload/WagersResponse.dart';
import 'package:sport_betting_mobile/notifier/AccountInfoHolder.dart';

import 'util/ApiConsts.dart';
import 'util/RequestParams.dart';

abstract class BetApi {
  Future<bool> makeBet(BuildContext context, String firstTeamScore,
      String secondTeamScore, String amount, SportEvent sportEvent);
}

class BetService implements BetApi {

  Future<bool> makeBet(BuildContext context, String firstTeamScore,
      String secondTeamScore, String amount, SportEvent sportEvent) async {

    var url = ApiConsts.API_APPLICATION_ENDPOINT + "user/make-bet";

    final model = Provider.of<AccountInfoHolder>(context, listen: false);
    String username = model.email.trim();
    String password = model.password.trim();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    int firstTeamScoreNum = int.parse(firstTeamScore.trim());
    int secondTeamScoreNum = int.parse(secondTeamScore.trim());
    int amountNum = int.parse(amount.trim());

    Map<String, String> requestBody = new Map<String, String>();
    requestBody['sportEventId'] = sportEvent.id;
    requestBody['amount'] = amountNum.toString();
    requestBody['homeTeamScore'] = firstTeamScoreNum.toString();
    requestBody['awayTeamScore'] = secondTeamScoreNum.toString();

    String jsonStr = jsonEncode(requestBody);

    return await http
        .post(Uri.encodeFull(url),
            headers: <String, String>{
              'authorization': basicAuth,
              "Content-Type": "application/json"
            },
            body: jsonStr)
        .then((http.Response response) {
      if (response.statusCode == ApiConsts.HTTP_OK) {
        //upd wagers
        int numOfWagersNum = int.parse(model.numOfWagers) + 1;
        model.numOfWagers = (numOfWagersNum).toString();

        //upd balance
        double bal = double.parse(model.balance) - amountNum;
        model.balance = (bal).toString();
        return true;
      }
      return false;
    });
  }
}
