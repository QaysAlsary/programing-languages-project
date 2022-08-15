import 'package:flutter/material.dart';

import 'add_products.dart';
import 'home_page.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: loginScreen.loginRout,
      routes: {
        Home.homeRout: (context) => Home(),
        AddProducts.addProductsRout: (context) => AddProducts(),
        loginScreen.loginRout: (context) => loginScreen(),
        // Profile.profileRout:(context)=>Profile(),
      },
    );
  }
}
