import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/Images/ImagesMaps.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider userProv = Provider.of<UserProvider>(context, listen: false);
    userProv.getAllBooking();
    return Consumer<UserProvider>(builder: (context, value, child) {
      List<UserBooking> allBooking = value.allBooking;
      if (allBooking.isEmpty) {
        return Center(
          child: Text('No booked services yet '),
        );
      } else {
        return Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: CachedNetworkImage()),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              allBooking[0].service,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Staff name",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              allBooking[0].staffName,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black45),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Date",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              allBooking[0].date.toString(),
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black45),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Statues",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black45),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              allBooking[0].confirmation == 0
                                  ? "Unconfirmed"
                                  : "Confirmed",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black45),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                userProv.setConfirmation(1);
                              },
                              color: Color(0xffff6ea1),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                //userProv.
                              },
                              color: Colors.black12,
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }
    });
  }
}
/**/
