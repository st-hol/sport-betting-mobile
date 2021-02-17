class SportEvent {
  String id;
  String startDate;
  String endDate;
  String title;
  String sportType;
  String alreadyPredicted;

  SportEvent({this.id, this.startDate, this.endDate, this.title,
      this.sportType, this.alreadyPredicted});

  factory SportEvent.fromJson(Map<String, dynamic> parsedJson) {
    return SportEvent(
      id: parsedJson['id'].toString(),
      startDate: parsedJson['startDate'].toString(),
      endDate: parsedJson['endDate'].toString(),
      title: parsedJson['title'],
      sportType: parsedJson['sportType'],
      alreadyPredicted: parsedJson['alreadyPredicted'].toString(),
    );
  }
}
