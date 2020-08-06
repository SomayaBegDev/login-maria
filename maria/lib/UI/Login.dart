import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/MainScreen.dart';
import 'package:maria/user/UI/Services.dart';

import 'Registration.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xffff6ea1),
                  ),
                  labelText: 'Username *',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffff6ea1),
                  ),
                  labelText: 'Password *',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(minWidth: 200),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Services(),
                  ));
                },
                color: Color(0xffff6ea1),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 15, color: Color(0xffff6ea1)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Registration()));
                  },
                  child: Text(
                    "Join us ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffff6ea1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "or ",
                  style: TextStyle(fontSize: 15, color: Color(0xffff6ea1)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                /*Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Services(),
                ));*/
              },
              color: Colors.red,
              child: Text(
                "Login with Gmail",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
