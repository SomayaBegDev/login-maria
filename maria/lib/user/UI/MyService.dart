import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/user/UI/UserMainScreen.dart';
import 'package:maria/user/model/UserBooking.dart';
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
  MyService(this.selectedService, this.userName);
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
  final _textEditingController = TextEditingController();

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

  bool isAvailable(List<UserBooking> allUsBoo) {
    bool availability = true;
    for (int i = 0; i < allUsBoo.length; i++) {
      if (allUsBoo[i].date == this.strSelDate &&
          allUsBoo[i].time == this.strSelTime &&
          allUsBoo[i].staffname == this.staffName) {
        availability = false;
        break;
      }
    }
    return availability;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    userProvider.getAllStaff();
    userProvider.getAllServices();
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
                          onChanged: (String value) {
                            staffName = value;
                          },
                          value: staffName,
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
                            decoration:
                                InputDecoration(hintText: "${this.strSelDate}"),
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
                        bool checkAvailable = isAvailable(allUserBooking);
                        if (checkAvailable) {
                          userProvider.setStaffName(this.staffName);

                          userProvider.setDate(this.strSelDate);
                          userProvider.setTime(this.strSelTime);

                          userProvider.setConfirmation(0);

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
                                                  this.userName)));
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

/*class MyService extends StatefulWidget {
  static DateTime date = DateTime.now();
  static TimeOfDay time = TimeOfDay.now();
  static DateTime selectedDate = null;
  static TimeOfDay selectedTime = null;
  static String strSelTime = "";
  static String strSelDate = "";
  static int selectedService;
  static String userName;
  MyService(selectedService, userName);
  static String staffName = "Maryam";

  static MaterialColor bootomTextColor = MaterialColor(0xffff6ea1, <int, Color>{
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

  static final _formKey = GlobalKey<FormState>();

  static getDate(BuildContext context) async {
    DateTime adate = await showDatePicker(
        context: context,
        initialDate: date,
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

    if (adate != null) {
      selectedDate = adate;
      strSelDate = selectedDate.toString().substring(0, 10);
    }
  }

  static getTime(BuildContext context) async {
    TimeOfDay atime = await showTimePicker(
        context: context,
        initialTime: time,
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
    if (atime != null) {
      selectedTime = atime;
      strSelTime = selectedTime.toString().substring(10, 15);
    }
  }

  static List<DropdownMenuItem<String>> showAlllStaff(
      List<UserStaff> allStaff) {
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

  static bool isAvailable(List<UserBooking> allUsBoo) {
    bool availability = true;
    for (int i = 0; i < allUsBoo.length; i++) {
      if (allUsBoo[i].date == strSelDate &&
          allUsBoo[i].time == strSelTime &&
          allUsBoo[i].staffname == staffName) {
        availability = false;
        break;
      }
    }
    return availability;
  }

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider.getAllStaff();
    userProvider.getAllServices();
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

          return Form(
            key: MyService._formKey,
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
                        allServices[MyService.selectedService].name,
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
                        items: MyService.showAlllStaff(allStaffs),
                        onChanged: (value) {
                          setState(() {
                            MyService.staffName = value;
                          });
                        },
                        value: MyService.staffName,
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
                            MyService.getDate(context);
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
                            MyService.getTime(context);
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
                          MyService.isAvailable(allUserBooking);
                      if (checkAvailable) {
                        userProvider.setStaffName(MyService.staffName);

                        userProvider.setDate(MyService.strSelDate);
                        userProvider.setTime(MyService.strSelTime);

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
                                                          MyService.userName)));
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
                                                MyService.selectedService,
                                                MyService.userName)));
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
        },
      ),
    );
  }
}
*/
