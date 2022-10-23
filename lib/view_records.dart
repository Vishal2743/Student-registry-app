import 'package:flutter/material.dart';

class ViewRecords extends StatelessWidget {
  late List<Map<String, String>> studentListDetails;

  ViewRecords(this.studentListDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ...(studentListDetails as List<Map<String, String>>).map((item) {
            return Row(
              children: [
                Column(
                  children: [
                    Text(item['register-number'] as String),
                    Text(item['name'] as String),
                  ],
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
