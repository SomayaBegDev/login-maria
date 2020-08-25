import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/user/UI/UserMainScreen.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/model/UserStaff.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class MyService extends StatelessWidget {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  DateTime selectedDate = null;
  TimeOfDay selectedTime = null;
  String strSelTime = "";
  String strSelDate = "";
  int selectedService;
  String userName;
  MyService(this.selectedService, this.userName);
  String staffName = "";

  MaterialColor bootomTextColor = MaterialColor(0xffff6ea1, <int, Color>{
    50: Color(0xffff6ea1),
    100: Color(0xffff6ea1),
    200: Color(0xffff6ea1),
    300: Color(0xffff6ea1),
    400: Color(0xffff6ea1),
    500: Color(0xffff6ea1),
    600: Color(0xffff6ea1),
    700: Color(0xffff6ea1),
    800: Color(0xffff6ea1),
    900: Color(0xffff6ea1),
  });

  final _formKey = GlobalKey<FormState>();

  getDate(BuildContext context) async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: this.date,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: appBarColor,
              accentColor: appBarColor,
              primarySwatch: bootomTextColor,
            ),
            child: child,
          );
        });

    if (date != null) {
      this.selectedDate = date;
      this.strSelDate = this.selectedDate.toString().substring(0, 10);
    }
  }

  getTime(BuildContext context) async {
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: this.time,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: appBarColor,
              accentColor: appBarColor,
              primarySwatch: bootomTextColor,
            ),
            child: child,
          );
        });
    if (time != null) {
      this.selectedTime = time;
      this.strSelTime = this.selectedTime.toString().substring(10, 15);
    }
  }

  List<DropdownMenuItem<String>> showAlllStaff(List<UserStaff> allStaff) {
    List<DropdownMenuItem<String>> allstaffList = [];
    for (int i = 0; i < allStaff.length; i++) {
      allstaffList.add(DropdownMenuItem(
        value: allStaff[i].staffname,
        child: Text(
          allStaff[i].staffname,
          style: TextStyle(
            color: const Color(0xffff6ea1),
            fontSize: 15,
          ),
        ),
      ));
    }
    return allstaffList;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    userProvider.getAllStaff();
    userProvider.getAllServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          "Book a Service",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          List<UserStaff> allStaffs = value.allStaff;
          List<UserService> allServices = value.allServices;
          List<UserBooking> bookingForAllUsers = value.allUserBooking;
          if (allStaffs.isEmpty) {
            return Container();
          } else {
            return Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Service",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          allServices[selectedService].name,
                          style: TextStyle(
                            color: const Color(0xffff6ea1),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Staff",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        DropdownButton(
                          items: showAlllStaff(allStaffs),
                          onChanged: (value) {
                            staffName = value;
                          },
                        ),
                      ],
                    ),

                    /*  DropdownButton(
                  value: 1,
                  items: [
                    DropdownMenuItem(
                      child: Text("Choose a Service"),
                      value: 1,
                    ),
                  ],
                  onChanged: (val) {
                    // _value = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: TextField(
                            onTap: () {
                              getDate(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: TextField(
                            onTap: () {
                              getTime(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        //bool availability = isAvailable(bookingForAllUsers,
                        //this.staffName, this.selectedDate);

                        userProvider.setStaffName(this.staffName);

                        userProvider.setDate(this.strSelDate);
                        userProvider.setTime(this.strSelTime);

                        userProvider.setConfirmation(0);

                        userProvider.addNewBooking();
                        showModalBottomSheet(
                            context: context,
                            builder: (_) => Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "The service has been booked correctly!",
                                        style: showDiaStyle,
                                      ),
                                      FlatButton(
                                        child: Text('Got it'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserMainScreen(
                                                          this.userName)));
                                        },
                                      ),
                                    ],
                                  ),
                                ));
                        /* else {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "The booking failed try another date or time please !",
                                    style: showDiaStyle,
                                  ),
                                  FlatButton(
                                    child: Text('Got it'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => MyService(
                                                  this.selectedService,
                                                  this.userName)));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }*/
                      },
                      color: Color(0xffff6ea1),
                      child: Text(
                        "Make a Booking",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

/*
                        calendarStyle: CalendarStyle(
                            todayColor: Colors.black12,
                            todayStyle: TextStyle(color: Colors.black),
                            weekdayStyle: TextStyle(color: appBarColor),
                            selectedColor: appBarColor,
                            selectedStyle: TextStyle(color: Colors.black)),
                        calendarController: _controller,
                     */
