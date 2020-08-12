import 'package:flutter/material.dart';
import 'package:maria/cpanel/UI/ShowBooking.dart';
import '../../Constant/Images/ImagesAndConst.dart';
import 'ShowAdmins.dart';
import 'ShowBooking.dart';
import 'ShowServices.dart';
import 'ShowStaff.dart';

class ControlPanel extends StatelessWidget {
  String adminName;
  ControlPanel(this.adminName);
  int selOrder = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          'Control Panel',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        itemCount: cPannelMain.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500, crossAxisSpacing: 50, childAspectRatio: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              // constraints: BoxConstraints(minWidth: 200, maxHeight: 100),
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(5),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(cPannelMain.values.toList()[index]),
                  ),
                  Text(
                    cPannelMain.keys.toList()[index],
                    style: TextStyle(
                      color: const Color(0xffff6ea1),
                      fontSize: 20,
                    ),
                  )
                ],
              )),
            ),
            onTap: () {
              selOrder = index;
              if (selOrder == 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ShowStaff()));
              } else if (selOrder == 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ShowServices()));
              } else if (selOrder == 2) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ShowAdmins()));
              } else {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ShowBooking()));
              }
            },
          );
        },
      ),
    );
  }
}
