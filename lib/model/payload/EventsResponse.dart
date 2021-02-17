import '../SportEvent.dart';
import 'BaseResponse.dart';

abstract class EventListItem {}

class SportEventItem implements EventListItem {
  SportEvent sportEvent;

  SportEventItem(this.sportEvent);
}

class EventsResponse extends BaseResponse{

  final List<EventListItem> events;

  EventsResponse({this.events}) : super.name('', '');

  factory EventsResponse.fromJson(List<dynamic> json) {
    List<SportEvent> items =
    json.map((i) => SportEvent.fromJson(i)).toList();

    List<EventListItem> sportEventList = List<EventListItem>();

    for (var i = 0; i < items.length; i++) {
      sportEventList.add(SportEventItem(items[i]));
    }

    return EventsResponse(
      events: sportEventList,
    );
  }

  factory EventsResponse.parseErrorResponse(Map<String, dynamic> json) {
    EventsResponse response  = EventsResponse();
    response.errorCode = json['error'].toString();
    response.errorMessage = json['message'];
    return response;
  }
}