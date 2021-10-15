import 'package:flutter_technical_test/models/login_model.dart';
import 'package:flutter_technical_test/models/navbar_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Navbar behaviour", () {
    final NavbarModel navbarModel = NavbarModel();
    navbarModel.login = LoginModel();
    test("Shouldn't be able to switch tab if not logged", () {
      expect(navbarModel.setCurrentTab(1), false);
    });
  });
}
