import 'dart:convert';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inventory/AllScreen/HomeScreen.dart';
import 'package:inventory/AllScreen/registration.dart';
import 'package:http/http.dart' as http;
import 'package:inventory/ApiCall/pages/detail.dart';
import 'package:inventory/ApiCall/pages/home.dart';
import 'package:inventory/main.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  static String idScreen = "login";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String login = 'http://192.168.20.203:8080/api/auth/signin';

  void _login(BuildContext context) async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // var reqbody = {
      //   "uesrmail": emailController.text,
      //   "password": passwordController.text
      // };

      var reqBody = {
        "username": emailController.text,
        "password": passwordController.text,
      };

      var header = headers;

      var response = await http.post(Uri.parse(login),
          headers: header, body: jsonEncode(reqBody));

      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);

        var myUser = jsonresponse['user'];
        print("mytoken ---------------");
        print(myUser);

        var myToken = jsonresponse['jwtToken'];

        final storage = const FlutterSecureStorage();

        await storage.write(key: 'token', value: myToken);

        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => MyHome(),
          ),
          (route) => false,
        );
      }
    }
  }

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
                          // print("User Email : " +
                          //     emailController.text +
                          //     " User Password : " +
                          //     passwordController.text);
                          _login(context);
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
