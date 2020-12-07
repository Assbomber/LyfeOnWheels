import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  String hintText;
  bool obscure;
  Function onchange;
  Widget prefixicon;
  String prefixtext;
  int maxLength;
  TextInputType textInputType;
  TextEditingController controller;
  Textfield(
      {this.textInputType = TextInputType.text,
      this.hintText,
      this.obscure,
      this.onchange,
      this.prefixicon,
      this.prefixtext,
      this.maxLength = null,
      this.controller = null});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      maxLength: maxLength,
      controller: controller,
      onChanged: onchange,
      obscureText: obscure,
      decoration: InputDecoration(
          prefixText: prefixtext,
          prefixIcon: prefixicon,
          labelText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
