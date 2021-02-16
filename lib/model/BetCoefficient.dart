class BetCoefficient {
  final String name;
  final String coefficient;

  BetCoefficient({this.name, this.coefficient});

  factory BetCoefficient.fromJson(Map<String, dynamic> parsedJson) {
    return BetCoefficient(
        name: parsedJson['name'],
        coefficient: parsedJson['coefficient']);
  }
}
