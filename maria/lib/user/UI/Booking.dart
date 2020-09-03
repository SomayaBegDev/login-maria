import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';

import 'UserMainScreen.dart';

class Booking extends StatelessWidget {
  String userName;
  Booking(this.userName);
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
                return Container(
                  child: Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (thisUseBoo[index].confirmation == 0) {
                        Provider.of<UserProvider>(context)
                            .deleteBooking(thisUseBoo[index].documentId);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        thisUseBoo[index].service,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: appBarColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                      Text(
                                        thisUseBoo[index].date.toString(),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                      Text(
                                        thisUseBoo[index].time.toString(),
                                        //.toString().substring(10, 16)
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  thisUseBoo[index].confirmation == 0
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              onPressed: () {
                                                thisUseBoo[index].confirmation =
                                                    1;
                                                Provider.of<UserProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateBooking(
                                                        thisUseBoo[index],
                                                        thisUseBoo[index]
                                                            .documentId);
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (_) => Container(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Text(
                                                                "The service has been confirmed correctly!",
                                                                style:
                                                                    showDiaStyle,
                                                              ),
                                                              FlatButton(
                                                                child: Text(
                                                                    'Got it'),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pushReplacement(MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              UserMainScreen(this.userName)));
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ));
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
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              constraints:
                                                  BoxConstraints(maxWidth: 180),
                                              child: TextField(
                                                onChanged: (comment) {
                                                  thisUseBoo[index].comment =
                                                      comment;
                                                },
                                                autocorrect: true,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Add a short comment",
                                                    alignLabelWithHint: true,
                                                    hintStyle: TextStyle(
                                                        color: appBarColor)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SmoothStarRating(
                                              color: appBarColor,
                                              borderColor: appBarColor,
                                              rating: userProv.evaluation,
                                              isReadOnly: false,
                                              filledIconData: Icons.star,
                                              halfFilledIconData:
                                                  Icons.star_half,
                                              defaultIconData:
                                                  Icons.star_border,
                                              starCount: 5,
                                              allowHalfRating: true,
                                              spacing: 2.0,
                                              onRated: (value) {
                                                thisUseBoo[index].evaluation =
                                                    value;
                                              },
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  onPressed: () {
                                                    Provider.of<UserProvider>(
                                                            context,
                                                            listen: false)
                                                        .updateBooking(
                                                            thisUseBoo[index],
                                                            thisUseBoo[index]
                                                                .documentId);

                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder:
                                                            (_) => Container(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                        "The comment & evaluation have been updated correctly!",
                                                                        style:
                                                                            showDiaStyle,
                                                                      ),
                                                                      FlatButton(
                                                                        child: Text(
                                                                            'Got it'),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          Navigator.of(context)
                                                                              .pushReplacement(MaterialPageRoute(builder: (context) => UserMainScreen(this.userName)));
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ));
                                                  },
                                                  color: Color(0xffff6ea1),
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
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
