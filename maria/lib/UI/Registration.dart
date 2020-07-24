import 'package:flutter/material.dart';

import 'Services.dart';

class Registration extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              constraints: BoxConstraints(maxWidth: 400),
              child: TextFormField(
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Services(),
                  ));
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
