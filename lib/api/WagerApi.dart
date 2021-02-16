import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sport_betting_mobile/model/payload/BetCoefficientsResponse.dart';
import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';
import 'package:sport_betting_mobile/model/payload/WagersResponse.dart';

import 'util/ApiConsts.dart';
import 'util/RequestParams.dart';

abstract class WagerApi {
  Future<WagersResponse> getWagersByPerson();
}

class WagerService implements WagerApi {

  Future<WagersResponse> getWagersByPerson() async {

    var url = "";

    return await http
        .get(Uri.encodeFull(url))
        .then((http.Response response) {

      final int statusCode = response.statusCode;
      final responseBody = json.decode(response.body);

      if (statusCode == ApiConsts.HTTP_OK) {
        if (responseBody is List) {
          return WagersResponse.fromJson(responseBody);
        } else {
          return WagersResponse.parseErrorResponse(responseBody);
        }
      }
      return null;
    });
  }

}