import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory/AllScreen/loginScreen.dart';

class Registration extends StatelessWidget {
  static String idScreen = "register";
  // const LoginScreen({Key? key}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 238, 243),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 35.0,
              ),
              Center(
                child: Image(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWaATMxmbvgYFP_dYcqac5Pkh5qd49n1S2GA&usqp=CAU"),
                  width: 400.0,
                  height: 300.0,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                "Registration For New User ",
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ))),
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 229, 232, 229),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("First Name :" +
                              firstNameController.text +
                              "Last Name :" +
                              lastNameController.text +
                              "User Email : " +
                              emailController.text +
                              " User Password : " +
                              passwordController.text);
                          displayToastMessage(
                              "Registration successfull", context);
                        }),
                    SizedBox(
                      height: 4.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.restorablePushNamedAndRemoveUntil(
                            context, LoginScreen.idScreen, (route) => false);
                      },
                      child: Text("Back To Login"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
