import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lyfeonwheels/widgets/ListViewTile.dart';

class Authenticator {
  UserCredential userCredential;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> allowLogin(String email, String password) async {
    userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (userCredential != null) {
      return Future.value(true);
    } else
      return false;
  }

  void signOut() async {
    await _auth.signOut();
  }

  Future<bool> registerUser(String email, String password, String fullname,
      String phone, String referral) async {
    userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    userCredential.user.updateProfile(displayName: fullname);
    var result2 = await _firestore.collection("Users").add({
      "Email": email,
      "Full Name": fullname,
      "Phone": phone,
      "Referral": referral,
      "Signed Up on": Timestamp.now()
    });
    if (userCredential != null) {
      return Future.value(true);
    } else
      Future.value(false);
  }

  Future<bool> postRequest(
      String fullname,
      String phone,
      String age,
      String weight,
      String pickAddress,
      String pickCity,
      String pickPin,
      String dateTime,
      String dropAddress,
      String dropCity,
      String dropPin,
      String noOfPerson,
      String serviceType) async {
    var result = await _firestore.collection("Requests").add({
      "Full Name": fullname,
      "Phone": phone,
      "Age": age,
      "Weight": weight,
      "Pickup Address": pickAddress,
      "Pickup City and State": pickCity,
      "Pickup Pin": pickPin,
      "Pick Date and Time": dateTime,
      "Drop Address": dropAddress,
      "Drop City and State": dropCity,
      "Drop Pin": dropPin,
      "Quoted Price": null,
      "Customer Agreed": null,
      "Canceled": null,
      "Request Added on": Timestamp.now(),
      "Email": userCredential.user.email,
      "Number Of Person": noOfPerson,
      "Service Type": serviceType
    });
    if (result != null)
      return Future.value(true);
    else
      return Future.value(false);
  }

  Future<List<ListViewTile>> getRequests() async {
    List<ListViewTile> list = [];
    var result = await _firestore
        .collection("Requests")
        .where("Email", isEqualTo: userCredential.user.email)
        .get();
    for (var message in result.docs) {
      list.add(ListViewTile(
        serviceType: message.data()["Service Type"],
        customerAgree: message.data()["Customer Agreed"],
        id: message.reference.id,
        from: message.data()["Pickup City and State"],
        to: message.data()["Drop City and State"],
        price: message.data()["Quoted Price"],
        time: message.data()["Pick Date and Time"],
      ));
    }
    return list;
  }

  Future<bool> updateRequest(String id, String field, String value) async {
    await _firestore.doc("Requests/$id").update({field: value});
    return Future.value(true);
  }

  void sendMessage(String message) async {
    await _firestore.doc("Messages/${userCredential.user.uid}").set({
      "Last Updated": Timestamp.now(),
      "Last Sent By": "Customer",
      "Email": userCredential.user.email
    });
    await _firestore
        .collection("Messages")
        .doc("${userCredential.user.uid}")
        .collection("chats")
        .add({
      "Sender": userCredential.user.email,
      "Message": message,
      "Timestamp": Timestamp.now()
    });
    print("sent messagee");
  }

  Future<Stream<QuerySnapshot>> getMessages() async {
    var messages = await _firestore
        .collection("Messages")
        .doc("${userCredential.user.uid}")
        .collection("chats")
        .orderBy("Timestamp", descending: true)
        .snapshots();
    return messages;
  }

  void resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
