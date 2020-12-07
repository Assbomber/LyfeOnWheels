import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Function onpressed;
  Color color;
  double padding;
  @override
  Button(
      {this.text, this.onpressed, this.color = Colors.red, this.padding = 20});
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(padding),
      onPressed: onpressed,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
