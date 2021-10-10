import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test/providers/login_model.dart';
import 'package:flutter_technical_test/providers/navbar_model.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginModel signIn = Provider.of<LoginModel>(context);
    NavbarModel navbar = Provider.of<NavbarModel>(context);

    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: false,
              validator: validateEmail,
              controller: _emailController,
            ),
            TextFormField(
              autofocus: false,
              validator: validatePassword,
              controller: _passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate())
                  return;
                signIn.username = _emailController.text;
                signIn.password = _passwordController.text;
                if (await signIn.signIn()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Successfully connected"),
                      backgroundColor: Colors.green,
                    )
                  );
                  navbar.currentTab = 1;
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    String? _msg;
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty) {
      _msg = "Please enter an email address";
    } else if (!regex.hasMatch(value)) {
      _msg = "Please provide a valid email address";
    }
    return _msg;
  }

  String? validatePassword(String? value) {
    String? _msg;
    if (value!.isEmpty) {
      _msg = "Please enter a password";
    }
    return _msg;
  }
}
