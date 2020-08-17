import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/UI/widgets/AdminBooking.dart';
import 'package:maria/cpanel/model/Booking.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:provider/provider.dart';

class ShowBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    adminProvider.getAllUserBooking();
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text('Booking Control Panel'),
          ),
          body: Consumer<AdminProvider>(
            builder: (context, value, child) {
              List<Booking> allUserBooking = value.allUserBooking;
              if (allUserBooking.isEmpty) {
                return Center(
                  child: Text('No Booking Found'),
                );
              } else {
                return ListView.builder(
                  itemCount: allUserBooking.length,
                  itemBuilder: (context, index) {
                    return AdminBooking(
                      booking: allUserBooking[index],
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
