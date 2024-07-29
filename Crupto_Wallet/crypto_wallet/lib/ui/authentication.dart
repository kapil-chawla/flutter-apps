import 'package:crypto_wallet/net/flutter_fire.dart';
import 'package:crypto_wallet/ui/home_view.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailField,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "something@email.com",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: _passwordField,
              style: TextStyle(
                color: Colors.white,
              ),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "password",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate = await register(
                      _emailField.text.trim(), _passwordField.text.trim());
                  if (shouldNavigate) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  }
                },
                child: Text("Register"),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate = await signIn(
                      _emailField.text.trim(), _passwordField.text.trim());
                  if (shouldNavigate) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  }
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
