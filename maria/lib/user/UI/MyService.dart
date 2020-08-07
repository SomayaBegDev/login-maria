import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/user/UI/Services.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/model/UserStaff.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Booking.dart';
import '../../Constant/Images/ImagesMaps.dart';

class MyService extends StatelessWidget {
  int selectedService;
  MyService(this.selectedService);
  String staffName = "";
  DateTime selectedDate = null;
  String time = "";
  final _formKey = GlobalKey<FormState>();
  CalendarController _controller = CalendarController();

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
      List<UserBooking> booFAU, String aStName, DateTime aDate, String aTime) {
    for (int i = 0; i < booFAU.length; i++) {
      if (booFAU[i].staffName == aStName &&
          booFAU[i].date == aDate &&
          booFAU[i].time == aTime) {
        return false;
      } else {
        return true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    userProvider.getAllStaff();
    userProvider.getAllServices();
    userProvider.getBookingForAllUser();
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
          List<UserBooking> bookingForAllUsers = value.bookingForAllUser;
          if (allStaffs.isEmpty) {
            return Container();
          } else {
            return Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: 100, maxHeight: 690),
                            child: TableCalendar(
                              calendarStyle: CalendarStyle(
                                  todayColor: Colors.black12,
                                  todayStyle: TextStyle(color: Colors.black),
                                  weekdayStyle: TextStyle(color: appBarColor),
                                  selectedColor: appBarColor,
                                  selectedStyle:
                                      TextStyle(color: Colors.black)),
                              calendarController: _controller,
                              onDaySelected: (date, event) {
                                selectedDate = date;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                        SizedBox(
                          width: 20,
                        ),
                        DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text("10 AM"),
                              value: "10 AM",
                            ),
                            DropdownMenuItem(
                              child: Text("11 AM"),
                              value: "11 AM",
                            ),
                          ],
                          onChanged: (value) {
                            time = value;
                          },
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
                        bool availability = isAvailable(bookingForAllUsers,
                            this.staffName, this.selectedDate, this.time);
                        if (availability == true) {
                          userProvider.setStaffName(this.staffName);

                          userProvider.setDate(this.selectedDate);

                          userProvider.setTime(this.time);

                          userProvider.setConfirmation(0);

                          userProvider.setUserName("somaya");

                          userProvider.addNewBooking();

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Booking(),
                          ));
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Services(),
                          ));
                        }

                        /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Booking(),
                        ));*/
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
