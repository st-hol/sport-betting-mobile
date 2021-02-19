import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sport_betting_mobile/api/util/ApiConsts.dart';

import 'package:sport_betting_mobile/model/dto/UpdateInfo.dart';
import 'package:sport_betting_mobile/model/payload/UserResponse.dart';
import 'package:sport_betting_mobile/notifier/AccountInfoHolder.dart';

abstract class AccountApi {
  Future<UserResponse> getAccountDetails(
      BuildContext context, String username, String password);

  Future<bool> changeInfo(BuildContext context, String name, String email);

  void logout(BuildContext context);
}

class AccountService implements AccountApi {
  Future<bool> processLoginRequest(
      BuildContext context, String username, String password) async {
    bool successfulLogin = false;
    //load details
    UserResponse userResponse =
        await getAccountDetails(context, username, password);

    if (userResponse.errorCode == '') {
      successfulLogin = true;
      populateAccountData(context, userResponse, password);
    } else {
      successfulLogin = false;
    }
    return successfulLogin;
  }

  Future<UserResponse> getAccountDetails(
      BuildContext context, String username, String password) async {
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

  void populateAccountData(
      BuildContext context, UserResponse userResponse, String inputPassword) {

    final model = Provider.of<AccountInfoHolder>(context, listen: false);
    model.id = userResponse.user.id;
    model.name = userResponse.user.name;
    model.email = userResponse.user.email;
    model.password = userResponse.user.encryptedPassword;
    model.password = inputPassword;
    model.city = 'Kyiv'; //todo
    model.country = 'Ukraine'; //todo
    model.balance = userResponse.user.balance;
    model.numOfWagers = userResponse.user.numOfWagers;
  }

  Future<bool> changeInfo(
      BuildContext context, String name, String email) async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "user/update-info";

    final model = Provider.of<AccountInfoHolder>(context, listen: false);
    String username = model.email.trim();
    String password = model.password.trim();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    name = name.trim();
    email = email.trim();

    Map<String, String> requestBody = new Map<String, String>();
    requestBody['id'] = model.id;
    requestBody['name'] = name;
    requestBody['email'] = email;
    String jsonStr = jsonEncode(requestBody);

    return await http
        .put(Uri.encodeFull(url),
            headers: <String, String>{
              'authorization': basicAuth,
              "Content-Type": "application/json"
            },
            body: jsonStr)
        .then((http.Response response) {
      if (response.statusCode == ApiConsts.HTTP_OK) {
        model.name = name;
        model.email = email;
        return true;
      }
      return false;
    });
  }

  void logout(BuildContext context) {
    final model = Provider.of<AccountInfoHolder>(context, listen: false);
    model.clearAll();
  }
}
