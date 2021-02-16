class AccountDetails {
  static String _id;
  static String _name;
  static String _email;
  static String _password;
  static String _city;
  static String _country;
  static String _balance;
  static String _numOfWagers;

  static String get balance => _balance;

  static set balance(String value) {
    _balance = value;
  }

  static String get password => _password;

  static set password(String value) {
    _password = value;
  }

  static String get id => _id;

  static set id(String value) {
    _id = value;
  }

  static String get name => _name;

  static set name(String value) {
    _name = value;
  }

  static String get country => _country;

  static set country(String value) {
    _country = value;
  }

  static String get city => _city;

  static set city(String value) {
    _city = value;
  }

  static String get email => _email;

  static set email(String value) {
    _email = value;
  }

  static String get numOfWagers => _numOfWagers;

  static set numOfWagers(String value) {
    _numOfWagers = value;
  }
}
