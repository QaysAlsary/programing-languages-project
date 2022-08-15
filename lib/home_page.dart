import 'package:flutter/material.dart';

import 'add_products.dart';
import 'controllers/databasehelper.dart';
import 'details_screen.dart';
import 'item_card.dart';
import 'products.dart';
import 'profile.dart';
import 'search.dart';

class Home extends StatefulWidget {
  static const String homeRout = 'Home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int bottomNavBarIndex = 0;
  List<Products> productss = [];
  List<Widget> screens = [
    Home(),
    Profile(),
  ];
  DatabaseHelper database = DatabaseHelper();

  void setList() async {
    productss = await database.getProducts();
    setState(() {});
  }

  void initState() {
    setList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => searchScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            itemCount: productss.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return ItemCard(
                products: productss[index],
                press: () async {
                  Products? p;
                  database.getOneProduct(productss[index].id!)?.then((value) {
                    print("sssssssssssssssssssssssssssss $value");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  products: value,
                                )));
                  });
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(
            Icons.edit,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProducts()),
            );
          }),
      // bottomNavigationBar: BottomNavigationBar(
      //   fixedColor: Colors.green,
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: bottomNavBarIndex,
      //   onTap: (index) {
      //     setState(() {
      //       bottomNavBarIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.menu,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.account_circle_outlined,
      //       ),
      //       label: 'profile',
      //     ),
      //   ],
      // ),
    );
  }
}
