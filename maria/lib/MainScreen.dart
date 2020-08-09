import 'package:flutter/material.dart';
import 'package:maria/user/UI/Services.dart';
import 'package:maria/cpanel/UI/ControlPanel.dart';
import 'package:maria/user/UI/UserMainScreen.dart';
import 'UI/Login.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: const Color(0xffff6ea1),
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                      'assets/images/logoandother/MariaWhite.png'),
                  //fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ));
  }
}
