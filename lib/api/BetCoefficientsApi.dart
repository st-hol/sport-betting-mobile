import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sport_betting_mobile/model/payload/BetCoefficientsResponse.dart';
import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';

import 'util/ApiConsts.dart';
import 'util/RequestParams.dart';

abstract class BetCoefficientsApi {
  Future<BetCoefficientsResponse> getBetCoefficients();
}

class BetCoefficientsService implements BetCoefficientsApi {


  Future<BetCoefficientsResponse> getBetCoefficients() async {

    var url = "";

    return await http
        .get(Uri.encodeFull(url))
        .then((http.Response response) {

      final int statusCode = response.statusCode;
      final responseBody = json.decode(response.body);

      if (statusCode == ApiConsts.HTTP_OK) {
        if (responseBody is List) {
          return BetCoefficientsResponse.fromJson(responseBody);
        } else {
          return BetCoefficientsResponse.parseErrorResponse(responseBody);
        }
      }
      return null;
    });
  }

}