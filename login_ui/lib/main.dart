import 'package:flutter/material.dart';
import 'package:login_ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isValidUsername = true;
  bool isValidPassword = true;
  var usernameError = "Username is invalid";
  var passwordError =
      "Password must have at least 6 characters and a special character";
  String string = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 70,
                width: 70,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[200]),
                child: FlutterLogo(),
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            Center(
              child: Text('Hello\nWelcome Back',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 40),
              child: TextField(
                  controller: usernameController,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      labelText: 'USERNAME',
                      errorText: !isValidUsername ? usernameError : null,
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                      controller: passwordController,
                      obscureText: showPassword,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          errorText: !isValidPassword ? passwordError : null,
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 15))),
                  GestureDetector(
                    onTap: onToggleShowPassword,
                    child: Text(
                      showPassword ? 'SHOW' : 'HIDE',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: onSignInClicked,
                  textColor: Colors.white,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'NEW USER? ',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff888888)),
                      ),
                      Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ],
                  ),
                  Text(
                    'FORGOT PASSWORD',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onToggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void onSignInClicked() {
    setState(() {
      if (usernameController.text.length < 6 ||
          !usernameController.text.contains("@")) {
        isValidUsername = false;
      } else {
        isValidUsername = true;
      }

      if (passwordController.text.length < 6) {
        isValidPassword = false;
      } else {
        isValidPassword = true;
      }

      string = "$isValidUsername and $isValidPassword";

      if (isValidUsername && isValidPassword) {
        // Navigator.push(context, MaterialPageRoute(builder: gotoHomePage));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  Widget gotoHomePage(BuildContext context) {
    return HomePage();
  }
}
