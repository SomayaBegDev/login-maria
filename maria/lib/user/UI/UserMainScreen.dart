import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/model/User.dart';
import 'package:maria/user/UI//Booking.dart';

import 'Services.dart';

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
                text: 'Services',
              ),
              Tab(
                text: 'Booked Services',
              )
            ]),
          ),
          body: TabBarView(children: [Services(this.username), Booking()]),
        ));
  }
}
