import 'package:flutter/material.dart';
import 'package:lyfeonwheels/constants.dart';
import 'package:lyfeonwheels/widgets/Button.dart';
import 'package:lyfeonwheels/widgets/CustomDropDown.dart';
import 'package:lyfeonwheels/widgets/Textfield.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String currentValue;
  bool boolean = false;
  String fullname, phone, email, password;

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (cont) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Textfield(
                  hintText: "Full Name",
                  obscure: false,
                  prefixicon: Icon(Icons.person),
                  onchange: (string) {
                    fullname = string;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Textfield(
                  prefixtext: "+1",
                  hintText: "Phone",
                  obscure: false,
                  prefixicon: Icon(Icons.call),
                  onchange: (string) {
                    phone = string;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Textfield(
                  hintText: "Email",
                  obscure: false,
                  prefixicon: Icon(Icons.email),
                  onchange: (string) {
                    email = string;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Textfield(
                  hintText: "Password",
                  obscure: true,
                  prefixicon: Icon(Icons.texture),
                  onchange: (string) {
                    password = string;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDropDown(
                  currentValue: currentValue,
                  hinttext: "How did you hear about us?",
                  list: <String>[
                    "Search Engine (Google, Bing etc.)",
                    " Friend/Family",
                    "Social Media (Facebook, Twitter etc.)",
                    "Advertisements"
                  ],
                  onchange: (string) {
                    setState(() {
                      currentValue = string;
                    });
                  },
                ),
                CheckboxListTile(
                    title: Text("I agree to the Terms and Conditions"),
                    value: boolean,
                    onChanged: (val) {
                      setState(() {
                        boolean = val;
                      });
                    }),
                Button(
                  text: "Register",
                  onpressed: () async {
                    if (fullname == null ||
                        email == null ||
                        phone == null ||
                        password == null) {
                      Scaffold.of(cont).showSnackBar(
                          SnackBar(content: Text("All fields are mandatory")));
                    } else if (validateEmail(email)) {
                      Scaffold.of(cont).showSnackBar(
                          SnackBar(content: Text("Email is badly formatted")));
                    } else if (validateMobile(phone)) {
                      Scaffold.of(cont).showSnackBar(SnackBar(
                          content: Text("Phone number is badly formatted")));
                    } else if (boolean == false) {
                      Scaffold.of(cont).showSnackBar(SnackBar(
                          content:
                              Text("Please agree to Terms and Conditions")));
                    } else {
                      try {
                        bool result = await auth.registerUser(
                            email, password, fullname, phone, currentValue);
                        if (result) {
                          Scaffold.of(cont).showSnackBar(SnackBar(
                              content: Text(
                                  "Registration successful. Redirecting to login screen")));
                          Future.delayed(
                              Duration(
                                seconds: 2,
                              ), () {
                            Navigator.popAndPushNamed(context, "/");
                          });
                        }
                      } catch (e) {
                        Scaffold.of(cont)
                            .showSnackBar(SnackBar(content: Text(e.message)));
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
