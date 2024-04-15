
// ignore_for_file: avoid_print, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_1/main.dart';

fireStoreCreateUser() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(globalUser?.phoneNumber)
      .set({
        'firstName': globalUser?.firstName,
        'lastName': globalUser?.lastName,
        
        'phoneNumber': globalUser?.phoneNumber,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

fireStoreReadUser() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(globalUser?.phoneNumber)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      globalUser?.setAll(
        firstName: data['firstName'],
        lastName: data['lastName'],
        phoneNumber: data['phoneNumber'],
      );
      print('Document data: ${data['firstName']}');
    } else {
      print('Document does not exist on the database');
    }
  });
}
