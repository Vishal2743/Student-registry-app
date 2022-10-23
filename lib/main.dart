import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_register/tabs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Map<String, String>> studentListDetails = [
    {
      'register-number': 'RA2011031010013',
      'name': 'Vishal Aravinth A',
    },
    {
      'register-number': 'RA2011031010015',
      'name': 'Aakash G',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabsScreen(studentListDetails),
    );
  }
}
