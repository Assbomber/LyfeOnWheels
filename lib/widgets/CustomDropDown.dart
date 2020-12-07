import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  String hinttext;
  List<String> list;
  String currentValue;
  Function onchange;
  CustomDropDown({this.currentValue, this.onchange, this.list, this.hinttext});
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wheelchair_pickup),
        labelText: hinttext,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: currentValue,
            isDense: true,
            onChanged: onchange,
            items: list.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                child: Text(
                  e,
                  style: TextStyle(color: Colors.blue),
                ),
                value: e,
              );
            }).toList()),
      ),
    );
  }
}
