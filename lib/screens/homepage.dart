import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/dog_model.dart';
import 'package:flutter_technical_test/models/login_model.dart';
import 'package:flutter_technical_test/models/navbar_model.dart';
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
            create: (context) => DogModel(),
        ),
        ChangeNotifierProvider(
            create: (context) => LoginModel(),
        ),
        ChangeNotifierProxyProvider<LoginModel, NavbarModel>(
          create: (context) => NavbarModel(),
          update: (context, login, navbar) {
            if (navbar == null) throw ArgumentError.notNull('dogList');
            navbar.login = login;
            return navbar;
          },
        ),
      ],
      child: Consumer<NavbarModel>(
        builder: (context, navbar, child) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              // leading: Icon(Icons.arrow_back),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
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
                  if (!navbar.setCurrentTab(index)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("You must be logged in to access the dog list", textAlign: TextAlign.center),
                          backgroundColor: Colors.red,
                        )
                    );
                  }
                }
            ),
          );
        },
      ),
    );
  }
}
