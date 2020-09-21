import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/model/Category.dart';
import 'package:maria/user/UI/UserMainScreen.dart';
import 'package:maria/user/model/UserBooking.dart';
import 'package:maria/user/model/UserCategory.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/model/UserStaff.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class MyService extends StatelessWidget {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  DateTime selectedDate = null;
  TimeOfDay selectedTime = null;
  String strSelTime = "";
  String strSelDate = "";
  int selectedService;
  String userName;
  UserCategory userCategory;
  MyService(this.selectedService, this.userName, this.userCategory);
  String staffName = "Maryam";

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

  getDate(BuildContext context, UserProvider userProvider) async {
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
      userProvider.setDate(this.strSelDate);
    }
  }

  getTime(BuildContext context, UserProvider userProvider) async {
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
      userProvider.setTime(this.strSelTime);
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

  bool isAvailable(List<UserBooking> allUsBoo, UserProvider userProvider) {
    bool availability = true;
    for (int i = 0; i < allUsBoo.length; i++) {
      if (allUsBoo[i].date == userProvider.date &&
          allUsBoo[i].time == userProvider.time &&
          allUsBoo[i].staffname == userProvider.staffName) {
        availability = false;
        break;
      }
    }
    return availability;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    userProvider.getAllStaff();
    userProvider.getAllServices(this.userCategory);
    userProvider.getAllUserBooking();
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
          List<UserBooking> allUserBooking = value.allUserBooking;
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
                          "Category",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          this.userCategory.name,
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
                          onChanged: (String value) async {
                            userProvider.setStaffName(value);
                          },
                          value: userProvider.staffName,
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
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: "${userProvider.date}",
                                hintStyle: TextStyle(color: appBarColor)),
                            onTap: () {
                              getDate(context, userProvider);
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
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: "${userProvider.time}",
                                hintStyle: TextStyle(color: appBarColor)),
                            onTap: () {
                              getTime(context, userProvider);
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
                        bool checkAvailable =
                            isAvailable(allUserBooking, userProvider);
                        if (checkAvailable) {
                          userProvider.setConfirmation(0);
                          userProvider.setComment("");
                          userProvider.setEvaluation(0.0);

                          userProvider.addNewBooking();
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserMainScreen(this
                                                                .userName)));
                                          },
                                        ),
                                      ],
                                    ),
                                  ));
                        } else {
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
                                                  this.userName,
                                                  this.userCategory)));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
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
