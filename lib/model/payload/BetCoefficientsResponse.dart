import '../BetCoefficient.dart';
import 'BaseResponse.dart';

abstract class BetCoefficientListItem {}

class BetCoefficientItem implements BetCoefficientListItem {
  BetCoefficient betCoeff;

  BetCoefficientItem(BetCoefficient betCoeff) {
    this.betCoeff = betCoeff;
  }
}

class BetCoefficientsResponse extends BaseResponse {
  final List<BetCoefficientListItem> betCoeffs;

  BetCoefficientsResponse({this.betCoeffs}) : super.name('', '');

  factory BetCoefficientsResponse.fromJson(List<dynamic> json) {
    List<BetCoefficient> items =
        json.map((i) => BetCoefficient.fromJson(i)).toList();

    List<BetCoefficientListItem> betCoeffsList = List<BetCoefficientListItem>();

    for (var i = 0; i < items.length; i++) {
      betCoeffsList.add(BetCoefficientItem( items[i]));
    }

    return BetCoefficientsResponse(
      betCoeffs: betCoeffsList,
    );
  }

  factory BetCoefficientsResponse.parseErrorResponse(Map<String, dynamic> json) {
    BetCoefficientsResponse response = BetCoefficientsResponse();
    response.errorCode = json['error'].toString();
    response.errorMessage = json['message'];
    return response;
  }
}
