import 'ApiConsts.dart';
import 'RequestParams.dart';

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