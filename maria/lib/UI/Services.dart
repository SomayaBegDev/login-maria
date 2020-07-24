import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constant/Images/ImagesMaps.dart';
import 'MyService.dart';

class Services extends StatelessWidget {
  int selIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final data = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          'Services',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        itemCount: servicesImages.length,
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
                    child: Image.asset(servicesImages.values.toList()[index]),
                  ),
                  Text(
                    servicesImages.keys.toList()[index],
                    style: TextStyle(
                      color: const Color(0xffff6ea1),
                      fontSize: 20,
                    ),
                  )
                ],
              )),
            ),
            onTap: () {
              selIndex = index;
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyService(selIndex)));
            },
          );
        },
      ),
    );
  }
}
