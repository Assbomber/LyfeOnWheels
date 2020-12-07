import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lyfeonwheels/authenticator.dart';
import 'package:lyfeonwheels/widgets/ListViewTile.dart';

TextStyle font16grey = TextStyle(fontSize: 16, color: Colors.grey);
Authenticator auth = Authenticator();

bool validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(pattern);
  return (!regExp.hasMatch(value)) ? true : false;
}

bool validateNumber(String value) {
  String pattern = r'(^(?[0-9]$))';
  RegExp regExp = new RegExp(pattern);
  return (!regExp.hasMatch(value)) ? true : false;
}

class Data extends ChangeNotifier {
  List<ListViewTile> requests = [];
  Stream<QuerySnapshot> messages;

  void updateRequests(List<ListViewTile> list) {
    requests = list;
    notifyListeners();
  }

  void updateMessages(Stream<QuerySnapshot> data) {
    messages = data;
    notifyListeners();
  }
}
