import '../BetCoefficient.dart';
import '../Wager.dart';
import 'BaseResponse.dart';

abstract class WagerListItem {}

class WagerItem implements WagerListItem {
  Wager wager;

  WagerItem(Wager wager) {
    this.wager = wager;
  }
}

class WagersResponse extends BaseResponse {
  final List<WagerListItem> wagers;

  WagersResponse({this.wagers}) : super.name('', '');

  factory WagersResponse.fromJson(List<dynamic> json) {
    List<Wager> items =
    json.map((i) => Wager.fromJson(i)).toList();

    List<WagerListItem> wagersList = List<WagerListItem>();

    for (var i = 0; i < items.length; i++) {
      wagersList.add(WagerItem(items[i]));
    }

    return WagersResponse(
      wagers: wagersList,
    );
  }

  factory WagersResponse.parseErrorResponse(Map<String, dynamic> json) {
    WagersResponse response = WagersResponse();
    response.errorCode = json['error'].toString();
    response.errorMessage = json['message'];
    return response;
  }
}
