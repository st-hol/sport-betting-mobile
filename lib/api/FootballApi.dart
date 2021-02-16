import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';

import 'util/ApiConsts.dart';
import 'util/RequestParams.dart';

abstract class SportEventApi {
  Future<EventsResponse> getEvents();
}

class SportEventService implements SportEventApi {

  Future<EventsResponse> getEvents() async {

    var requestParams = RequestParams();
    requestParams.addPathParam("action", "get_events");
    // requestParams.addPathParam("league_id", leagueId.toString());

    DateTime oneDayAgo = DateTime.now().subtract(new Duration(days: 1))
    .subtract(new Duration(days: 300));
    DateTime thirtyDayFromNow = DateTime.now().add(new Duration(days: 31));

    var formatter = new DateFormat('yyyy-MM-dd');

    requestParams.addPathParam("from", formatter.format(oneDayAgo));
    requestParams.addPathParam("to", formatter.format(thirtyDayFromNow));

    var url = _composeUrl(requestParams);

    return await http
        .get(Uri.encodeFull(url))
        .then((http.Response response) {

      final int statusCode = response.statusCode;
      final responseBody = json.decode(response.body);

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

  String _composeUrl(RequestParams params){

    var url = ApiConsts.API_FOOTBALL_ENDPOINT;

    if(params!=null) {

      var i = 0;
      params.pathParams.forEach((k, v) {
        if (i == 0) {
          url = url + "?";
        } else {
          url = url + "&";
        }
        url = url + k + "=" + v;
        i++;
      });

      url = url + "&APIkey=" + ApiConsts.API_FOOTBALL_KEY;

    }
    return url;
  }


}