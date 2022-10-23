import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  late List<Map<String, String>> studentListDetails;
  DetailsScreen(this.studentListDetails);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  OutlineInputBorder borderTheme = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: Color.fromRGBO(77, 183, 153, 1),
    ),
  );

  TextEditingController studentRegisterNumber = TextEditingController();
  TextEditingController studentName = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    dbRef = FirebaseDatabase.instance.ref().child('Students');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: studentRegisterNumber,
              ),
              const SizedBox(height: 10),
              TextField(
                cursorColor: const Color.fromRGBO(77, 183, 153, 1),
                decoration: InputDecoration(
                  enabledBorder: borderTheme,
                  focusedBorder: borderTheme,
                  hintText: "Name",
                ),
                controller: studentName,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Map<String, String> students = {
                      'register-number': studentRegisterNumber.text,
                      'name': studentName.text,
                    };
                    dbRef.push().set(students);
                    widget.studentListDetails.add({
                      'register-number': studentRegisterNumber.text,
                      'name': studentName.text,
                    });
                  });
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
