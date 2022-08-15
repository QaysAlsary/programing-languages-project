import 'package:flutter/material.dart';
import 'package:languges_project/controllers/databasehelper.dart';

import 'edit.dart';
import 'login_screen.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class myProducts {
  final String image, name, price;

  myProducts({
    required this.image,
    required this.name,
    required this.price,
  });
}

class _ProfileState extends State<Profile> {
  List<myProducts> prouduct = [
    myProducts(
      image: 'images/Blueberry.png',
      name: 'Blueberry',
      price: '200\$',
    ),
    myProducts(
      image: 'images/meat.png',
      name: 'meat',
      price: '500\$',
    ),
    myProducts(
      image: 'images/Tomato.png',
      name: 'Tomato',
      price: '200\$',
    ),
  ];
  DatabaseHelper database = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              database.logout()!.whenComplete(() {
                if (database.status) {
                  //status true mean there is error
                  print('Failed please check your email or password');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginScreen(),
                    ),
                  ); //push
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                  ),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45.0,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('images/user.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'qays alssary',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Dismissible(
                key: Key('prouduct[index]'),
                child: buildItem(prouduct[index]),
                background: slideRightBackground(),
                secondaryBackground: slideLeftBackground(),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    final bool res = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                "Are you sure you want to delete the prouduct?"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              FlatButton(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  // TODO: Delete the item from DB etc..
                                  setState(() {
                                    prouduct.removeAt(index);
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                    return res;
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => editScreen(),
                      ),
                    );
                  }
                },
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              itemCount: prouduct.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(myProducts prouduct) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('${prouduct.image}'),
            ),
            SizedBox(
              width: 30.0,
            ),
            Column(
              children: [
                Text(
                  '${prouduct.name}',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ],
        ),
      );

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
