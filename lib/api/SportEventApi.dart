import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';
import 'package:sport_betting_mobile/notifier/AccountInfoHolder.dart';

import 'util/ApiConsts.dart';

abstract class SportEventApi {
  Future<EventsResponse> getEvents();
}

class SportEventService implements SportEventApi {

  Future<EventsResponse> getEvents() async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "user/events";

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
          return EventsResponse.fromJson(responseBody);
        } else {
          return EventsResponse.parseErrorResponse(responseBody);
        }
      }
      return null;
    });
  }




}