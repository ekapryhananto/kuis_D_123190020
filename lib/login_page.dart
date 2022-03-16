import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Column(children: [
          Image.asset('images/playstore.png'),
          _usernameField(),
          _passwordField(),
          _loginButton(context),
        ]),
      ),
    );
  }
  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(32.0)),
          ),
        ),
    );
  }
  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: TextFormField(
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(32.0)),
          ),
        ),
    );
  }
  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(32.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          color: Colors.lightBlueAccent,
          onPressed: () {
            String text = "";
            if (username == "eka" && password ==
                "123") {
              setState(() {
                text = "Login Success";
                isLoginSuccess = true;
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context){
                    return HomePage(username: username, pass: password);
                  }));
            } else {
              setState(() {
                text = "Login Failed";
                isLoginSuccess = false;
              });
            }
            print("isLoginSuccess : $isLoginSuccess");
            SnackBar snackBar = SnackBar(
              content: Text(text),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
      )

    );
  }
}