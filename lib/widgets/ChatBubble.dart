import 'package:flutter/material.dart';
import 'package:lyfeonwheels/constants.dart';

class ChatBubble extends StatelessWidget {
  String sender;
  String message;
  bool local;
  ChatBubble({this.message, this.sender});
  @override
  Widget build(BuildContext context) {
    local = sender == auth.userCredential.user.email;
    return Column(
      crossAxisAlignment:
          local ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: local ? Colors.lightBlueAccent : Colors.redAccent,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: local ? Radius.circular(20) : Radius.circular(0),
                topRight: local ? Radius.circular(0) : Radius.circular(20)),
          ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          padding: EdgeInsets.all(10),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
