import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/model/UserStaff.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';

import 'Booking.dart';
import '../../Constant/Images/ImagesMaps.dart';

class MyService extends StatelessWidget {
  int selectedService;
  MyService(this.selectedService);
  final _formKey = GlobalKey<FormState>();

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
    Provider.of<UserProvider>(context, listen: false).getAllStaff();
    Provider.of<UserProvider>(context, listen: false).getAllServices();
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
                            Provider.of<UserProvider>(context, listen: false)
                                .setStaffName(value);
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

                    DropdownButton(
                      value: 1,
                      items: [
                        DropdownMenuItem(
                          child: Text("Choose a date"),
                          value: 1,
                        ),
                      ],
                      onChanged: (val) {
                        // _value = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                      value: 1,
                      items: [
                        DropdownMenuItem(
                          child: Text("Choose a time"),
                          value: 1,
                        ),
                      ],
                      onChanged: (val) {
                        // _value = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Booking(),
                        ));
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

/*child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
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
                DropdownButton(
                  value: 1,
                  items: [
                    DropdownMenuItem(
                      child: Text("Choose a staff"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Choose a staff"),
                      value: 1,
                    ),
                  ],
                  onChanged: (val) {
                    //_value = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton(
                  value: 1,
                  items: [
                    DropdownMenuItem(
                      child: Text("Choose a date"),
                      value: 1,
                    ),
                  ],
                  onChanged: (val) {
                    // _value = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton(
                  value: 1,
                  items: [
                    DropdownMenuItem(
                      child: Text("Choose a time"),
                      value: 1,
                    ),
                  ],
                  onChanged: (val) {
                    // _value = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Booking(),
                    ));
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
        ),*/
