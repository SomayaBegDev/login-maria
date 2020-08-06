import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'MyService.dart';

class Services extends StatelessWidget {
  int selIndex = 0;

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).getAllServices();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffff6ea1),
          title: Text(
            'Services ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<UserProvider>(
          builder: (context, value, child) {
            List<UserService> allServices = value.allServices;
            if (allServices.isEmpty) {
              return Center(
                child: Text('No Services Available'),
              );
            } else {
              return GridView.builder(
                itemCount: allServices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2),
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
                            child: CachedNetworkImage(
                              imageUrl: allServices[index].imageURL,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Text(
                            allServices[index].name,
                            style: TextStyle(
                              color: const Color(0xffff6ea1),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Fee : ${allServices[index].fee}",
                            style: TextStyle(
                              color: const Color(0xffff6ea1),
                              fontSize: 15,
                            ),
                          )
                        ],
                      )),
                    ),
                    onTap: () {
                      selIndex = index;
                      Provider.of<UserProvider>(context, listen: false)
                          .setService(allServices[selIndex].name);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyService(selIndex)));
                    },
                  );
                },
              );
            }
          },
        ));
  }
}
