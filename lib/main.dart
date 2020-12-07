import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lyfeonwheels/constants.dart';
import 'package:lyfeonwheels/screens/Home.dart';
import 'package:lyfeonwheels/screens/LoginScreen.dart';
import 'package:lyfeonwheels/screens/PasswordReset.dart';
import 'package:lyfeonwheels/screens/Register.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => LoginScreen(),
          "/passwordReset": (context) => PasswordReset(),
          "/register": (context) => Register(),
          "/home": (context) => Home(),
        },
      ),
    );
  }
}
