// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/home/ui/otp_page.dart';
import 'package:task_1/main.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  // Controller for the phone number input field
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter your phone number',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Attempt to verify the phone number
                try {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    // Callback for successful verification
                    verificationCompleted: (PhoneAuthCredential credential) {
                      print("verificationCompleted");
                    },
                    // Callback for failed verification
                    verificationFailed: (FirebaseAuthException e) {
                      print("verificationFailed");
                    },
                    // Callback for when the code is sent successfully
                    codeSent: (String verificationId, int? resendToken) {
                      // Set the phone number in global user object
                      globalUser?.setPhoneNumber(phoneNumberController.text);
                      // Navigate to OTPPage with verification ID
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPPage(
                            verificationId: verificationId,
                          ),
                        ),
                      );
                    },
                    // Callback for auto retrieval timeout
                    codeAutoRetrievalTimeout: (String verificationId) {
                      // Handle timeout if needed
                    },
                  );
                } catch (e) {
                  // Handle generic exceptions
                  print("Error occurred: $e");
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
