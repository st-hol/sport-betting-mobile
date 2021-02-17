import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sport_betting_mobile/api/util/ApiConsts.dart';

import 'package:sport_betting_mobile/model/AccountInfoHolder.dart';
import 'package:sport_betting_mobile/model/payload/UserResponse.dart';

abstract class AccountApi {
  Future<UserResponse> getAccountDetails(String username, String password);
}

class AccountService implements AccountApi {
  Future<bool> processLoginRequest(String username, String password) async {
    bool successfulLogin = false;
    //load details
    UserResponse userResponse = await getAccountDetails(username, password);

    if (userResponse.errorCode == '') {
      successfulLogin = true;
      populateAccountData(userResponse, password);
    } else {
      successfulLogin = false;
    }
    return successfulLogin;
  }

  Future<UserResponse> getAccountDetails(
      String username, String password) async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "user/account";

    username = username.trim();
    password = password.trim();
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
        return UserResponse.fromJson(responseBody);
      } else {
        return UserResponse.parseErrorResponse(responseBody);
      }
    });
  }

  void populateAccountData(UserResponse userResponse, String inputPassword) {
    AccountDetails.id = userResponse.user.id;
    AccountDetails.name = userResponse.user.name;
    AccountDetails.email = userResponse.user.email;
    AccountDetails.password = userResponse.user.encryptedPassword;
    AccountDetails.password = inputPassword;
    AccountDetails.city = 'Kyiv'; //todo
    AccountDetails.country = 'Ukraine'; //todo
    AccountDetails.balance = userResponse.user.balance;
    AccountDetails.numOfWagers = userResponse.user.numOfWagers;
  }

  bool changeInfo(BuildContext context) {}
}
