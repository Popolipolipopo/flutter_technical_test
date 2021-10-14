import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/login_model.dart';
import 'package:flutter_technical_test/models/navbar_model.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "example@mail.com");
  final _passwordController = TextEditingController(text: "1234");

  @override
  Widget build(BuildContext context) {
    LoginModel signIn = Provider.of<LoginModel>(context);
    NavbarModel navbar = Provider.of<NavbarModel>(context);
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    /*return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            width: screenWidth,
            height: screenHeight / 3,
            decoration:  const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dog_cover.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            top: screenHeight / 3 - 10,
            child: Container(
              width: screenWidth,
              height: 3 * screenHeight / 4,
              decoration: const BoxDecoration(
                  color: Color(0xfffbfbfb),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )
              ),
              child: ListView(
                children: [

                ],
              ),
            )
        )
      ],
    );*/

    final widgetList = [
      const Padding(padding: EdgeInsets.all(10)),
      Row(
        children: const [
          SizedBox(
            width: 28,
          ),
          Text(
            'Sign in',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),

            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      const Padding(padding: EdgeInsets.all(20)),
      Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              width: screenWidth * 0.8,
              child: Material(
                elevation: 20,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.black,),
                    hintText: 'Enter your email',
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  validator: validateEmail,
                  controller: _emailController,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            SizedBox(
              width: screenWidth * 0.8,
              child: Material(
                elevation: 20,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.black,),
                    suffixIcon: IconButton(
                      icon: Icon(signIn.obscure ? Icons.visibility_off : Icons.visibility, color: Colors.black,),
                    onPressed: () {
                      signIn.obscure = !signIn.obscure;
                    },),
                    hintText: 'Enter your email',
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  validator: validatePassword,
                  controller: _passwordController,
                  obscureText: signIn.obscure,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            ButtonTheme(
              minWidth: screenWidth * 0.8,
              child: ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate())
                    return;
                  signIn.username = _emailController.text;
                  signIn.password = _passwordController.text;
                  if (await signIn.signIn()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Successfully connected", textAlign: TextAlign.center),
                          backgroundColor: Colors.green,
                        )
                    );
                    navbar.setCurrentTab(1);
                  }
                },
                child: const Text('Sign In'),
              ),
            )
          ],
        ),
      ),
    ];

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: false,
          snap: false,
          floating: false,
          expandedHeight: screenHeight / 4,
          //304,
          backgroundColor: const Color(0xFFFFFFFF),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background:
            Image.asset("assets/images/dog_cover.jpg", fit: BoxFit.cover),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
                gradient: LinearGradient(
                    colors: <Color>[Color(0xFFdccdb4), Color(0xFFd8c3ab)])
            ),
            width: screenWidth,
            height: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: screenWidth,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return widgetList[index];
            }, childCount: widgetList.length))
      ],
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
