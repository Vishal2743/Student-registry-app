import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/view_records.dart';

class HomePage extends StatelessWidget {
  OutlineInputBorder borderTheme = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: Color.fromRGBO(77, 183, 153, 1),
    ),
  );

  late String register_number;
  late String student_name;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(77, 183, 153, 1),
        title: Text('Add details'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => ViewRecords())),
            icon: Icon(Icons.view_agenda_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.27,
            left: 10,
            right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                cursorColor: const Color.fromRGBO(77, 183, 153, 1),
                decoration: InputDecoration(
                  enabledBorder: borderTheme,
                  focusedBorder: borderTheme,
                  hintText: "Register Number",
                ),
                onChanged: ((value) => register_number = value),
              ),
              const SizedBox(height: 10),
              TextField(
                cursorColor: const Color.fromRGBO(77, 183, 153, 1),
                decoration: InputDecoration(
                  enabledBorder: borderTheme,
                  focusedBorder: borderTheme,
                  hintText: "Name",
                ),
                onChanged: ((value) => student_name = value),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await users.add({
                    'Name': student_name,
                    'Register_Number': register_number,
                  }).then((value) => print('data added'));
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(77, 183, 153, 1),
                ),
                child: const Text(
                  "Add student",
                  style: TextStyle(color: Color.fromRGBO(19, 16, 57, 1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
