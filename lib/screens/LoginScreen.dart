import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lyfeonwheels/constants.dart';
import 'package:lyfeonwheels/widgets/Button.dart';
import 'package:lyfeonwheels/widgets/Textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;

  String password;

  String emailForPasswordRecovery;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (cont) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Image.asset('images/logoicon.png')),
                Flexible(
                    child: Hero(
                        tag: "logo", child: Image.asset('images/logo.png'))),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Textfield(
                  hintText: "Your Email",
                  obscure: false,
                  onchange: (string) {
                    email = string;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Textfield(
                  hintText: "Your Password",
                  obscure: true,
                  onchange: (string) {
                    password = string;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  text: "Log in",
                  onpressed: () async {
                    if (email == null)
                      Scaffold.of(cont).showSnackBar(
                          SnackBar(content: Text('*Email is Required')));
                    else if (password == null)
                      Scaffold.of(cont).showSnackBar(
                          SnackBar(content: Text('*Password is Required')));
                    else {
                      Scaffold.of(cont).showSnackBar(SnackBar(
                          backgroundColor: Colors.transparent,
                          content: LinearProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.blue),
                          )));
                      try {
                        bool val = await auth.allowLogin(email, password);
                        if (val == true) {
                          Navigator.popAndPushNamed(context, "/home");
                        }
                      } catch (e) {
                        Scaffold.of(cont)
                            .showSnackBar(SnackBar(content: Text(e.message)));
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot Password?",
                        textAlign: TextAlign.center, style: font16grey),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                children: [
                                  Textfield(
                                    obscure: false,
                                    hintText: "Your Email",
                                    onchange: (string) {
                                      emailForPasswordRecovery = string;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Button(
                                    text: "Get recovery link",
                                    onpressed: () async {
                                      if (emailForPasswordRecovery != null) {
                                        try {
                                          await auth.resetPassword(
                                              emailForPasswordRecovery);
                                          Scaffold.of(cont).showSnackBar(SnackBar(
                                              content: Text(
                                                  "Recovery link sent to your email. It might take some time.")));
                                          Navigator.pop(context);
                                        } catch (e) {
                                          Scaffold.of(cont).showSnackBar(
                                              SnackBar(
                                                  content: Text(e.message)));
                                        }
                                      } else {
                                        Scaffold.of(cont).showSnackBar(SnackBar(
                                            content:
                                                Text("Email is required")));
                                      }
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      child: Text(
                        "Click here",
                        style: font16grey.copyWith(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        textAlign: TextAlign.center, style: font16grey),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: Text(
                        "Sign up!",
                        style: font16grey.copyWith(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
