import 'package:flutter/foundation.dart';
import 'package:sport_betting_mobile/model/User.dart';

class AccountInfoHolder extends ChangeNotifier {
  String _id;
  String _name;
  String _email;
  String _encryptedPassword;
  String _password;
  String _city;
  String _country;
  String _balance;
  String _numOfWagers;

  String get id => _id;

  set id(String value) {
    _id = value;
    AccountDetails.id = value;
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    AccountDetails.name = value;
    notifyListeners();
  }

  String get numOfWagers => _numOfWagers;

  set numOfWagers(String value) {
    _numOfWagers = value;
    AccountDetails.numOfWagers = value;
    notifyListeners();
  }

  String get balance => _balance;

  set balance(String value) {
    _balance = value;
    AccountDetails.balance = value;
    notifyListeners();
  }

  String get country => _country;

  set country(String value) {
    _country = value;
    AccountDetails.country = value;
    notifyListeners();
  }

  String get city => _city;

  set city(String value) {
    _city = value;
    AccountDetails.city = value;
    notifyListeners();
  }

  String get password => _password;

  set password(String value) {
    _password = value;
    AccountDetails.password = value;
    notifyListeners();
  }

  String get encryptedPassword => _encryptedPassword;

  set encryptedPassword(String value) {
    _encryptedPassword = value;
    AccountDetails.encryptedPassword = value;
    notifyListeners();
  }

  String get email => _email;

  set email(String value) {
    _email = value;
    AccountDetails.email = value;
    notifyListeners();
  }

  void clearAll() {
    id = "";
    name = "";
    email = "";
    encryptedPassword = "";
    password = "";
    city = "";
    country = "";
    balance = "";
    numOfWagers = "";
    notifyListeners();
    AccountDetails.id = "";
    AccountDetails.name = "";
    AccountDetails.email = "";
    AccountDetails.encryptedPassword = "";
    AccountDetails.password = "";
    AccountDetails.city = "";
    AccountDetails.country = "";
    AccountDetails.balance = "";
    AccountDetails.numOfWagers = "";
  }
}

class AccountDetails {
  static String _id;
  static String _name;
  static String _email;
  static String _password;
  static String _encryptedPassword;
  static String _city;
  static String _country;
  static String _balance;
  static String _numOfWagers;

  static String get encryptedPassword => _encryptedPassword;

  static set encryptedPassword(String value) {
    _encryptedPassword = value;
  }

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
