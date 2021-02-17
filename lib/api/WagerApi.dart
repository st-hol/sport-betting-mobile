import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sport_betting_mobile/model/payload/BetCoefficientsResponse.dart';
import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';
import 'package:sport_betting_mobile/model/payload/WagersResponse.dart';
import 'package:sport_betting_mobile/notifier/AccountInfoHolder.dart';

import 'util/ApiConsts.dart';
import 'util/RequestParams.dart';

abstract class WagerApi {
  Future<WagersResponse> getWagersByPerson();
}

class WagerService implements WagerApi {

  Future<WagersResponse> getWagersByPerson() async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "user/wagers";

    String username = AccountDetails.email.trim();
    String password = AccountDetails.password.trim();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    return await http.get(Uri.encodeFull(url), headers: <String, String>{
      'authorization': basicAuth
    }).then((http.Response response) {
      final int statusCode = response.statusCode;
      var responseBody;

      if (response.body == "") {
        Map<String, dynamic> respWithCodeOnly = Map<String, dynamic>();
        respWithCodeOnly['error'] = statusCode;
        responseBody = respWithCodeOnly;
      } else {
        responseBody = json.decode(response.body);
      }

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
