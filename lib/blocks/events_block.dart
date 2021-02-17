import 'package:rxdart/rxdart.dart';
import 'package:sport_betting_mobile/api/SportEventApi.dart';
import 'dart:async';

import 'package:sport_betting_mobile/model/payload/EventsResponse.dart';

class EventsBlock {
  final eventsController = PublishSubject();
  final SportEventService service = SportEventService();

  Stream get events => eventsController.stream;
  EventsResponse initialData;

  void getEvents() async {
    EventsResponse response = await service.getEvents();
    if (response != null) {
      eventsController.sink.add(response);
    }
  }

  void dispose() {
    eventsController.close();
  }
}
