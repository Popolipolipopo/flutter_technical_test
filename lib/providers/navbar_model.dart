import 'package:flutter/cupertino.dart';
import 'package:flutter_technical_test/screens/dog_list.dart';
import 'package:flutter_technical_test/screens/login.dart';

class NavbarModel extends ChangeNotifier {
  int _currentTab = 0;
  List<Widget> _screens = [Login(), DogList()];

  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  int get currentTab => this._currentTab;

  Widget get currentScreen => this._screens[this._currentTab];

}
