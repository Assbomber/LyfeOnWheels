import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyfeonwheels/constants.dart';
import 'package:lyfeonwheels/screens/BookScreen.dart';
import 'package:lyfeonwheels/screens/ChatScreen.dart';
import 'package:lyfeonwheels/screens/StatusScreen.dart';
import 'package:lyfeonwheels/widgets/CustomDropDown.dart';
import 'package:lyfeonwheels/widgets/Textfield.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Widget> list = <Widget>[BookScreen(), StatusScreen(), ChatScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Hero(
            tag: "logo",
            child: Image.asset(
              'images/logo.png',
              width: 170,
            )),
        actions: [
          IconButton(
              onPressed: () async {
                await auth.signOut();
                Navigator.popAndPushNamed(context, "/");
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: list.elementAt(selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.wheelchair_pickup), label: "Book"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Status"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
