import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/cpanel/model/Service.dart';
import 'package:maria/cpanel/providers/AdminProvider.dart';
import 'package:maria/cpanel/UI/AdminService.dart';
import 'package:maria/cpanel/UI/AdminTextField.dart';
import 'package:provider/provider.dart';

class ShowServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text('Service Control Panel'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'New Service',
              ),
              Tab(
                text: 'All Services',
              )
            ]),
          ),
          body: TabBarView(children: [AddNewService(), AllServices()]),
        ));
  }
}

class AddNewService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextField(
                onChanged: (value) {
                  adminProvider.setServiceName(value);
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Service Name *",
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: TextField(
                onChanged: (value) {
                  adminProvider.setFee(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Fee *",
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            constraints: BoxConstraints(minWidth: 200),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                adminProvider.addNewService();
              },
              color: Color(0xffff6ea1),
              child: Text(
                "Add Service",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class AllServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context, listen: false).getAllServices();
    // TODO: implement build
    return Consumer<AdminProvider>(
      builder: (context, value, child) {
        List<Service> allServices = value.allServices;
        if (allServices.isEmpty) {
          return Center(
            child: Text('No Services Found'),
          );
        } else {
          return ListView.builder(
            itemCount: allServices.length,
            itemBuilder: (context, index) {
              return AdminService(
                service: allServices[index],
              );
            },
          );
        }
      },
    );
  }
}
