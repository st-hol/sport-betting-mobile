import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sport_betting_mobile/api/util/ApiConsts.dart';

import 'package:sport_betting_mobile/api/util/RequestParams.dart';
import 'package:sport_betting_mobile/model/payload/UserResponse.dart';

abstract class AccountApi {
  Future<UserResponse> getAccountDetails();
}

class AccountService implements AccountApi {

  bool processLoginRequest(BuildContext context) {
    //todo load details

    //todo handle
    if (true) {
      Navigator.pushNamed(context, '/cabinet');
      return true;
    } else {
      return false;
    }
  }

  bool changeInfo(BuildContext context) {}

  Future<UserResponse> getAccountDetails() async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "user/account";

    return await http.get(Uri.encodeFull(url)).then((http.Response response) {
      final int statusCode = response.statusCode;
      final responseBody = json.decode(response.body);

      if (statusCode == ApiConsts.HTTP_OK) {
        return UserResponse.fromJson(responseBody);
      } else {
        return UserResponse.parseErrorResponse(responseBody);
      }
    });
  }
}
