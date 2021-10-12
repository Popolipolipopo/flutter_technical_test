import 'package:flutter/cupertino.dart';
import 'package:flutter_technical_test/screens/dog_list.dart';
import 'package:flutter_technical_test/screens/login.dart';

import 'login_model.dart';

class NavbarModel extends ChangeNotifier {
  int _currentTab = 0;
  List<Widget> _screens = [Login(), DogList()];
  late LoginModel _login;

  bool setCurrentTab(int tab) {
    if (!this._login.logged)
      return false;
    this._currentTab = tab;
    notifyListeners();
    return true;
  }

  set login(LoginModel newLogin) {
    _login = newLogin;
    notifyListeners();
  }

  int get currentTab => this._currentTab;

  Widget get currentScreen => this._screens[this._currentTab];

  LoginModel get login => _login;

}
