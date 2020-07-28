import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'MyService.dart';

class Services extends StatelessWidget {
  int selIndex = 0;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff6ea1),
        title: Text(
          'Services ${userProvider.allServices.length}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        itemCount: userProvider.allServices.length,
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
                    child: CachedNetworkImage(
                      imageUrl: userProvider.allServices[index].imageURL,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Text(
                    userProvider.allServices[index].name,
                    style: TextStyle(
                      color: const Color(0xffff6ea1),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Fee : ${userProvider.allServices[index].fee}",
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
