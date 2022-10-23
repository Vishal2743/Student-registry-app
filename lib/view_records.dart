import 'package:flutter/material.dart';

class ViewRecords extends StatelessWidget {
  late List<Map<String, String>> studentListDetails;
  ViewRecords(this.studentListDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Center(
                  child: Text("Register number"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Center(
                  child: Text("Name"),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          ...studentListDetails.map((item) {
            return Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Text(item['register-number'] as String),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Text(item['name'] as String),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
