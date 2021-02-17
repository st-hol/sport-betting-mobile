class User {
  final String id;
  final String email;
  final String inputPassword;
  final String encryptedPassword;
  final String name;
  final String balance;
  final String currency;
  final String birth;
  final String numOfWagers;

  User(
      {this.id,
      this.email,
      this.inputPassword,
      this.encryptedPassword,
      this.name,
      this.balance,
      this.currency,
      this.birth,
      this.numOfWagers});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        id: parsedJson['id'].toString(),
        email: parsedJson['email'],
        encryptedPassword: parsedJson['password'],
        name: parsedJson['name'],
        balance: parsedJson['balance'].toString(),
        currency: parsedJson['currency'].toString(),
        birth: parsedJson['birth'].toString(),
        numOfWagers: parsedJson['numOfWagers'].toString());
  }
}
