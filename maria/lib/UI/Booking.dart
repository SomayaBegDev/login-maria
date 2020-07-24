import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/Images/ImagesMaps.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffff6ea1),
          title: Text(
            'Booking',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(servicesImages.values.toList()[1]),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              servicesImages.keys.toList()[1],
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
                              "Staff name",
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
                              "Date",
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
                              "Statues",
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
                              onPressed: () {},
                              color: Color(0xffff6ea1),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {},
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
        ));
  }
}
