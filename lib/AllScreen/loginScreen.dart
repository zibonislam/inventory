import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory/AllScreen/registration.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  static String idScreen = "login";

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
                "Login For Exsiting User ",
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
                              "Login",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 229, 232, 229),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("User Email : " +
                              emailController.text +
                              " User Password : " +
                              passwordController.text);
                        }),
                    SizedBox(
                      height: 4.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.restorablePushNamedAndRemoveUntil(
                            context, Registration.idScreen, (route) => false);
                        displayToastMessage("To Registration", context);
                      },
                      child: Text("Don't have an Acoount? Register"),
                    )
                    // TextButton(onPressed: , child: child)
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
