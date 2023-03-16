import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventory/AllScreen/loginScreen.dart';
import 'package:inventory/AllScreen/HomeScreen.dart';
import 'package:inventory/AllScreen/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: Registration(),
      initialRoute: MyHome.idScreen,

      routes: {
        Registration.idScreen: (context) => Registration(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MyHome.idScreen: (context) => MyHome(),
      },
    );
  }
}
