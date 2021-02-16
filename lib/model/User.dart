class User {
 final String id;
 final String email;
 final String password;
 final String name;
 final String balance;
 final String currency;
 final String birth;

 User({this.id,
    this.email,
    this.password,
    this.name,
    this.balance,
    this.currency,
    this.birth});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        id: parsedJson['id'],
        email: parsedJson['email'],
        password: parsedJson['password'],
        name: parsedJson['name'],
        balance: parsedJson['balance'],
        currency: parsedJson['currency'],
        birth: parsedJson['birth']);
  }
}
