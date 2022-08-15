import 'package:flutter/material.dart';

import 'controllers/databasehelper.dart';
import 'home_page.dart';
import 'register.dart';

class loginScreen extends StatefulWidget {
  static const String loginRout = 'loginScreen';

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  // void loginApi() {
  //   String myUrl="http://127.0.0.1:8000/api/login";
  //   http.post(Uri.parse("http://127.0.0.1:8000/api/login"),body: {
  //     "email": "helez@gmail.com",
  //     "password":"12345678",
  //   }).then((response) {
  //     print('${response.statusCode==200}' );
  //
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Home(),
  //
  //         ),
  //       );
  //
  //   });
  //
  // }
  DatabaseHelper database = DatabaseHelper();
  late String msgStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: 500.0,
                child: Stack(
                  children: [
                    Container(
                      height: 225.0,
                      color: Colors.green[400],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 150.0,
                        left: 50.0,
                        right: 50.0,
                      ),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              )),
                          height: 300.0,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    'WELCOM',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  TextFormField(
                                    cursorColor: Colors.green,
                                    controller: userController,
                                    keyboardType: TextInputType.emailAddress,
                                    onFieldSubmitted: (value) {
                                      print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email address must be not empty';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.green,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                        20.0,
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    cursorColor: Colors.green,
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isPassword,
                                    onFieldSubmitted: (value) {
                                      print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password must be not empty';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.green,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          isPassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isPassword = !isPassword;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                        20.0,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 450.0,
                        left: 135.0,
                        right: 135.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(
                              20.0,
                            )),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(userController.text);
                              print(passwordController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );

                              database
                                  .login(
                                userController.text,
                                passwordController.text,
                              )!
                                  .whenComplete(() {
                                if (database.status) {
                                  //status true mean there is error
                                  print(
                                      'Failed please check your email or password');
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  ); //push
                                }
                              });
                            }
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an acount?',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => registerScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
