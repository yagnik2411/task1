import 'package:flutter/material.dart';
import 'package:task_1/home/model/user_model.dart';
import 'package:task_1/home/ui/phone_number_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

UserModel? globalUser = UserModel(firstName: '', lastName: '', phoneNumber: '');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,background: Colors.white,primary: Colors.deepPurple,secondary: Colors.deepPurpleAccent,error: Colors.red, surface: Colors.white, onPrimary: Colors.white, onSecondary: Colors.white, onSurface: Colors.black, onError: Colors.white),
        useMaterial3: true,
      ),
      home:  const PhoneNumberPage(),
    );
  }
}

