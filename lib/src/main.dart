import 'package:flutter/material.dart';
import 'home.dart';

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
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameErr = "Username's a format incorrect !";
  var _passWordErr = "Password's a format incorrect !";
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                  child: FlutterLogo()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text(
                "Hello \n Welcome Back",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                controller: _userController,
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "USERNAME",
                    errorText: _userInvalid ? _userNameErr : null,
                    labelStyle:
                    TextStyle(color: Color(0xff888888), fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    controller: _passController,
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        errorText: _passInvalid ? _passWordErr : null,
                        labelStyle: TextStyle(
                            color: Color(0xff888888), fontSize: 15)),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? "HIDE" : "SHOW",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: onSignInClicked,
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("NEW USER ? SIGN UP",
                        style: TextStyle(
                            color: Color(0xff888888), fontSize: 16)),
                    Text("FORGOT PASSWORD",
                        style: TextStyle(color: Colors.blue, fontSize: 16))
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() async {
      if (_userController.text.length < 256 ||
          !_userController.text.contains("@gmail.com") ||
          _userController.text.isEmpty) {
        _userInvalid = true;
        return;
      } else {
        _userInvalid = false;
      }
      if (_passController.text.length < 6 || _passController.text.isEmpty) {
        _passInvalid = true;
        return;
      } else {
        _passInvalid = false;
      }
      if (!_userInvalid && !_passInvalid) {
        // Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }
}
//
// Widget gotoHome(BuildContext context) {
//   return HomePage();
// }


