import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lyfeonwheels/constants.dart';
import 'package:lyfeonwheels/widgets/ChatBubble.dart';
import 'package:lyfeonwheels/widgets/Textfield.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  String message;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessages();
  }

  void getMessages() async {
    Stream<QuerySnapshot> stream = await auth.getMessages();
    Provider.of<Data>(context, listen: false).updateMessages(stream);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: StreamBuilder(
          stream: Provider.of<Data>(context).messages,
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  DocumentSnapshot message = snapshots.data.documents[index];
                  return ChatBubble(
                    sender: message.data()["Sender"],
                    message: message.data()["Message"],
                  );
                },
                itemCount: snapshots.data.documents.length,
                reverse: true,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: Textfield(
              controller: controller,
              hintText: "Your message....",
              obscure: false,
              onchange: (string) {
                message = string;
              },
            )),
            SizedBox(
              width: 5,
            ),
            FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.red,
                onPressed: () async {
                  if (message != null) {
                    await auth.sendMessage(message);
                    message = null;
                    controller.clear();
                  }
                },
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ))
          ],
        )
      ],
    );
  }
}
