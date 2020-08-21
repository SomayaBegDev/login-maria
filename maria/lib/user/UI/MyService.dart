import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/user/UI/Services.dart';
import 'package:maria/user/UI/UserMainScreen.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/model/UserStaff.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Booking.dart';
import '../../Constant/Images/ImagesMaps.dart';

class MyService extends StatelessWidget {
  DateTime date = DateTime.now();
  int selectedService;
  String userName;
  MyService(this.selectedService, this.userName);
  String staffName = "";
  var selectedDate = null;
  final _formKey = GlobalKey<FormState>();
  CalendarController _controller = CalendarController();
  /* getDate(BuildContext context) async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: this.date,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (date != null) {
      this.selectedDate = date;
    }
  }*/

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

  bool isAvailable(
      List<UserBooking> bookingFAU, String stName, Timestamp aDate) {
    String newSelectedDate = aDate.toDate().toString().substring(0, 10);
    String newSelctedTime = aDate.toDate().toString().substring(10, 16);
    bool res = true;
    for (int i = 0; i < bookingFAU.length; i++) {
      Timestamp bookedDate = bookingFAU[i].date;
      String bookedDateStr = bookedDate.toDate().toString().substring(0, 10);
      String bookedTimeStr = bookedDate.toDate().toString().substring(10, 16);
      if (bookingFAU[i].staffname == stName && bookingFAU[i].date == aDate) {
        res = false;
        break;
      }
    }
    return res;
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
                    SizedBox(
                      height: 10,
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

                    Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Flexible(
                      child: TableCalendar(
                        initialCalendarFormat: CalendarFormat.twoWeeks,
                        availableCalendarFormats: {
                          CalendarFormat.twoWeeks: "TwoWeeks"
                        },
                        calendarStyle: CalendarStyle(
                            todayColor: Colors.black12,
                            todayStyle: TextStyle(color: Colors.black),
                            weekdayStyle: TextStyle(color: appBarColor),
                            selectedColor: appBarColor,
                            selectedStyle: TextStyle(color: Colors.black)),
                        calendarController: _controller,
                        onDaySelected: (date, event) {
                          selectedDate = date;
                        },
                      ),
                    ),
                    /*ListTile(
                      title: Text(
                        "${date.year}-${date.month}-${date.day}",
                        textAlign: TextAlign.center,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: appBarColor,
                      ),
                      onTap: () {
                        getDate(context);
                      },
                    ),*/

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

                        userProvider.setDate(this.selectedDate);

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
/*Flexible(
                      child: TableCalendar(
                        initialCalendarFormat: CalendarFormat.twoWeeks,
                        availableCalendarFormats: {
                          CalendarFormat.twoWeeks: "TwoWeeks"
                        },
                        calendarStyle: CalendarStyle(
                            todayColor: Colors.black12,
                            todayStyle: TextStyle(color: Colors.black),
                            weekdayStyle: TextStyle(color: appBarColor),
                            selectedColor: appBarColor,
                            selectedStyle: TextStyle(color: Colors.black)),
                        calendarController: _controller,
                        onDaySelected: (date, event) {
                          selectedDate = date;
                        },
                      ),
                    ),*/
