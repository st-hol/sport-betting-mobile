import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sport_betting_mobile/api/FootballApi.dart';
import 'package:sport_betting_mobile/api/WagerApi.dart';
import 'package:sport_betting_mobile/model/Wager.dart';
import 'dart:async';

import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';
import 'package:sport_betting_mobile/model/payload/WagersResponse.dart';

class WagersBlock {
  final wagersController = PublishSubject();
  final WagerService service = WagerService();

  Stream get events => wagersController.stream;
  WagersResponse initialData;// = _prepareInitial();

  void getWagers() async {
    WagersResponse response = await service.getWagersByPerson();
    if (response != null) {
      wagersController.sink.add(response);
    }
  }

  void dispose() {
    wagersController.close();
  }

  static WagersResponse _prepareInitial() {
    List<WagerListItem> list = new List<WagerItem>();
    list.add(WagerItem(Wager(bet_type:"EXACT_SCORE", sport_type:"FOOTBALL")));
    WagersResponse  response = WagersResponse(wagers: list);
    return response;
  }
}
