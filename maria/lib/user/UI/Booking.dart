import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class Booking extends StatelessWidget {
  String userName;
  Booking(this.userName);
  Timestamp bookedDate = null;
  Timestamp bookedTime = null;
  List<UserBooking> thisUserBooking(List<UserBooking> allUsBoo) {
    List<UserBooking> thisUsBo = [];

    for (int i = 0; i < allUsBoo.length; i++) {
      if (allUsBoo[i].username == this.userName) {
        thisUsBo.add(allUsBoo[i]);
      }
    }

    return thisUsBo;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProv = Provider.of<UserProvider>(context, listen: false);
    userProv..getAllUserBooking();

    return Consumer<UserProvider>(
      builder: (context, value, child) {
        List<UserBooking> allUserBooking = value.allUserBooking;
        List<UserBooking> thisUseBoo = thisUserBooking(allUserBooking);

        if (thisUseBoo.isEmpty) {
          return Center(
            child: Text(
              'No booked services yet ',
              style: showDiaStyle,
            ),
          );
        } else {
          return ListView.builder(
              itemCount: thisUseBoo.length,
              itemBuilder: (context, index) {
                this.bookedDate = thisUseBoo[index].date;

                this.bookedTime = thisUseBoo[index].date;

                return Container(
                  child: Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      Provider.of<UserProvider>(context, listen: false)
                          .deleteBooking(thisUseBoo[index].documentId);
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: CachedNetworkImage(
                              imageUrl: thisUseBoo[index].imageUrl,
                            )),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        thisUseBoo[index].service,
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
                                            fontSize: 15,
                                            color: Colors.black45),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        thisUseBoo[index].staffname,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black45),
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
                                            fontSize: 15,
                                            color: Colors.black45),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${this.bookedDate.toDate().toString().substring(0, 10)}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black45),
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
                                        "Time",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black45),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${this.bookedTime.toDate().toString().substring(10, 16)}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black45),
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
                                        "Statues",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black45),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        thisUseBoo[index].confirmation == 0
                                            ? "Unconfirmed"
                                            : "Confirmed",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black45),
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () {
                                          Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .setConfirmation(1);
                                        },
                                        color: Color(0xffff6ea1),
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}

/*Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: CachedNetworkImage(
                      imageUrl: allUserBooking[0].imageUrl,
                    )),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                allUserBooking[0].service,
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
                                allUserBooking[0].staffname,
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
                              Expanded(
                                child: Text(
                                  "${allUserBooking[0].date}",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
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
                                "Statues",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black45),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                allUserBooking[0].confirmation == 0
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
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .setConfirmation(1);
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
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .deleteBooking(allBooking[0].documentId);
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
          );*/
