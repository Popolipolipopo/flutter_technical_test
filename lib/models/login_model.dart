import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class LoginModel extends ChangeNotifier {
  late String _username, _password, _token;

  bool _obscure = true;

  bool _logged = false;

  bool get logged => _logged;

  String get username => _username;

  String get password => _password;

  String get token => _token;

  bool get obscure => _obscure;

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

  set obscure(bool obscure) {
    this._obscure = obscure;
    notifyListeners();
  }

  Future<bool> signIn() async {
    try {
      var response = await Dio().post("https://reqres.in/api/login", data: {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
      });
      this._logged = true;
      this._token = response.data["token"];
      return true;
    } catch (e) {
      return false;
    }
  }
}
