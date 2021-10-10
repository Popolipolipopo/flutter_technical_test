import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class LoginModel extends ChangeNotifier {
  late String _username, _password, _token;

  String get username => _username;

  String get password => _password;

  String get token => _token;

  set username(String username) {
    this._username = username;
    notifyListeners();
  }

  set password(String username) {
    this._password = username;
    notifyListeners();
  }

  set token(String username) {
    this._token = username;
    notifyListeners();
  }

  Future<bool> signIn() async {
    try {
      var response = await Dio().get('https://reqres.in/api/login');
      print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
