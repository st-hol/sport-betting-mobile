class Wager {
  final String bet_type;
  final String event_title;
  final String sport_type;
  final String creation_time;
  final String wager_amount;
  final String currency;
  final String outcome;

  Wager({this.bet_type,
    this.event_title,
    this.sport_type,
    this.creation_time,
    this.wager_amount,
    this.currency,
    this.outcome});

  factory Wager.fromJson(Map<String, dynamic> parsedJson) {
    return Wager(
        bet_type: parsedJson['betType'],
        event_title: parsedJson['title'],
        sport_type: parsedJson['sportType'],
        creation_time: parsedJson['creationTime'],
        wager_amount: parsedJson['wager_amount'],
        currency: parsedJson['currency'],
        outcome: parsedJson['outcome']);
  }
}
