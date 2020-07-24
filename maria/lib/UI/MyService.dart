import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Booking.dart';
import '../Constant/Images/ImagesMaps.dart';

class MyService extends StatelessWidget {
  int selectedService;
  MyService(this.selectedService);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          servicesImages.keys.toList()[selectedService],
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              DropdownButton(
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
              ),
              DropdownButton(
                value: 1,
                items: [
                  DropdownMenuItem(
                    child: Text("Choose a staff"),
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
      ),
    );
  }
}
