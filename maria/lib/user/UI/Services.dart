import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maria/Constant/ColorsAndTextStyle.dart';
import 'package:maria/user/UI/UserMainScreen.dart';
import 'package:maria/user/model/UserCategory.dart';
import 'package:maria/user/model/UserService.dart';
import 'package:maria/user/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'MyService.dart';

class Services extends StatelessWidget {
  int selIndex = 0;
  String uName;
  UserCategory userCategory;
  Services(this.uName, this.userCategory);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider.getAllServices(this.userCategory);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => UserMainScreen(this.uName)));
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: appBarColor,
        title: Text('Welcome , ${this.uName}'),
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
                  crossAxisCount: 2, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    // padding: EdgeInsets.all(3),
                    //margin: EdgeInsets.all(5),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: CachedNetworkImage(
                            // cacheManager: Ca,
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
                              fontWeight: FontWeight.bold),
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
                    userProvider.setService(allServices[selIndex].name);
                    userProvider.setImageURL(allServices[index].imageURL);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyService(
                            selIndex, this.uName, this.userCategory)));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
