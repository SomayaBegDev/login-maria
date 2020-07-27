/*import 'dart:io';

import 'package:flutter/material.dart';
import 'Process.dart';
import '../../Constant/Images/ImagesAndConst.dart';

class AddAndRemove extends StatelessWidget {
  int staffOrServices;
  int addOrRemove;

  AddAndRemove(this.staffOrServices);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          staffAndServices[staffOrServices],
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        itemCount: addAndRemove.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500, crossAxisSpacing: 50, childAspectRatio: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(5),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(addAndRemove.values.toList()[index]),
                  ),
                  Text(
                    addAndRemove.keys.toList()[index],
                    style: TextStyle(
                      color: const Color(0xffff6ea1),
                      fontSize: 20,
                    ),
                  )
                ],
              )),
            ),
            onTap: () {
              addOrRemove = index;
              // Process(staffOrServices, addOrRemove);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Process(staffOrServices, addOrRemove)));
            },
          );
        },
      ),
    );
  }
}
*/
