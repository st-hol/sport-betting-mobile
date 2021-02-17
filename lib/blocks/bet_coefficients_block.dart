import 'package:rxdart/rxdart.dart';
import 'package:sport_betting_mobile/api/BetCoefficientsApi.dart';
import 'package:sport_betting_mobile/api/FootballApi.dart';
import 'package:sport_betting_mobile/model/BetCoefficient.dart';
import 'package:sport_betting_mobile/model/payload/BetCoefficientsResponse.dart';
import 'dart:async';

import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';

class SeeBetCoefficientsBlock {
  final betCoeffController = PublishSubject();
  final BetCoefficientsService service = BetCoefficientsService();

  Stream get coeffs => betCoeffController.stream;
  BetCoefficientsResponse initialData = _prepareInitial();

  void getEvents() async {
    BetCoefficientsResponse response = await service.getBetCoefficients();
    if (response != null) {
      betCoeffController.sink.add(response);
    }
  }

  void dispose() {
    betCoeffController.close();
  }

  static BetCoefficientsResponse _prepareInitial() {
    List<BetCoefficientListItem> list = new List<BetCoefficientListItem>();
    list.add(BetCoefficientItem(BetCoefficient(name:"bet", coefficient:"0.0")));
    BetCoefficientsResponse  response = BetCoefficientsResponse(betCoeffs: list);
    return response;
  }
}
