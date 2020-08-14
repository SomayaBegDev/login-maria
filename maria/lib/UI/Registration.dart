import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/model/User.dart';
import 'package:maria/user/UI/UserMainScreen.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';

import '../user/UI/Services.dart';

class Registration extends StatelessWidget {
  String username, pass, email;
  String userPass1 = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          'Join & Enjoy',
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
                validator: (usern) {
                  return usern == null ? "This field is required" : "";
                },
                onChanged: (usern) {
                  this.username = usern;
                  userProvider.setUserName(usern);
                },
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
                validator: (userp) {
                  return userp == null ? "This field is required" : "";
                },
                onChanged: (userp) {
                  this.userPass1 = userp;
                },
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
              constraints: BoxConstraints(maxWidth: 400),
              child: TextFormField(
                validator: (userp) {
                  String res = "";
                  if (userp != null) {
                    if (this.userPass1 != userp) {
                      res = "Enter the same password";
                    }
                  } else {
                    res = "This field is required";
                  }
                  return res;
                },
                onChanged: (userp) {
                  this.pass = userp;
                  userProvider.setUserPassword(userp);
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffff6ea1),
                  ),
                  labelText: 'Re-write password *',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextFormField(
                validator: (userE) {
                  return userE.contains("@")
                      ? ""
                      : "Please enter a correct email";
                },
                onChanged: (userE) {
                  this.email = userE;
                  userProvider.setUserEmail(userE);
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xffff6ea1),
                  ),
                  labelText: 'Email address *',
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
                  if (this.username != null &&
                      this.pass != null &&
                      this.userPass1 != null &&
                      this.userPass1 == this.pass &&
                      this.email != null &&
                      email.contains(('@'))) {
                    userProvider.addNewUser();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserMainScreen(this.username)));
                  } else {
                    showModalBottomSheet(
                        context: context,
                        builder: (_) => Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "All feiled are requred",
                                    style: showDiaStyle,
                                  ),
                                  FlatButton(
                                    child: Text('Got it'),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Registration()));
                                    },
                                  ),
                                ],
                              ),
                            ));
                  }
                },
                color: Color(0xffff6ea1),
                child: Text(
                  "Join us",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
