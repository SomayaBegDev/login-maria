import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/cpanel/model/Booking.dart';

class AdminBooking extends StatelessWidget {
  backgroundColor(Booking booking) {
    if (booking.confirmation == 0) {
      return Colors.black26;
    } else {
      return Colors.white;
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  Booking booking;
  AdminBooking({this.booking});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dismissible(
      key: UniqueKey(),
      child: Card(
        child: ListTile(
          title: Text(booking.service),
          subtitle: Text("${booking.staffname}\n "
              "Staff Name : ${booking.staffname}\n"
              "User Name : ${booking.username}\n"
              "Date : ${booking.date}\n"
              "Time : ${booking.time}\n"
              "Confirmation : ${booking.confirmation}\n"),
        ),
      ),
    );
  }
}
