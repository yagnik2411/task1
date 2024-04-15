import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/home/ui/register.dart';

class OTPPage extends StatefulWidget {
  final String verificationId;

  const OTPPage({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  // Controller for the OTP input field
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter your OTP',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: otpController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'OTP',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Create a PhoneAuthCredential with the verification ID and OTP
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: otpController.text,
                  );

                  // Sign in the user with the credential
                  await FirebaseAuth.instance.signInWithCredential(credential);

                  // Navigate to the next screen upon successful sign-in
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NameInputScreen(),
                    ),
                  );
                } catch (e) {
                  // Handle any errors that occur during sign-in
                  // ignore: avoid_print
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
