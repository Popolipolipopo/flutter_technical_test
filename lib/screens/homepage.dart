import 'package:flutter/material.dart';
import 'package:flutter_technical_test/providers/login_model.dart';
import 'package:flutter_technical_test/providers/navbar_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => NavbarModel()
        ),
        ChangeNotifierProvider(
            create: (context) => LoginModel()
        ),
      ],
      child: Consumer<NavbarModel>(
        builder: (context, navbar, child) {
          return Scaffold(
            body: navbar.currentScreen,
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  label: "Login",
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label: "Dogs",
                  icon: Icon(Icons.format_list_bulleted),
                )
              ],
              currentIndex: navbar.currentTab,
              onTap: (int index) {
                navbar.currentTab = index;
              }
            ),
          );
        },
      ),
    );
  }
}
