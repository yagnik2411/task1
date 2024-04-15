import 'package:flutter/material.dart';
import 'package:task_1/main.dart';

class HomeScreen extends StatelessWidget {
  // Extracting user details from globalUser object
  final String firstName = globalUser?.firstName ?? '';
  final String lastName = globalUser?.lastName ?? '';
  final String phoneNumber = globalUser?.phoneNumber ?? '';

  // Constructor
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Your Home Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Displaying user details
            Text(
              'First Name: $firstName',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Last Name: $lastName',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Phone Number: $phoneNumber',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
