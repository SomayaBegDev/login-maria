import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/MySplash.dart';
import 'package:maria/user/UI/Category.dart';
import 'package:maria/user/UI//Booking.dart';

class UserMainScreen extends StatelessWidget {
  String username = "";
  UserMainScreen(this.username);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text('Welcome , ${this.username}'),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
              ),
              Tab(
                icon: Icon(Icons.book),
              ),
            ]),
          ),
          body: TabBarView(
              children: [Category(this.username), Booking(this.username)]),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            backgroundColor: appBarColor,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MySplash()));
            },
          ),
        ));
  }
}
/* GestureDetector(
            child: Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()));
            },
          ),*/
