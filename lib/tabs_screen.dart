import 'package:flutter/material.dart';
import 'package:student_register/details_screen.dart';
import 'package:student_register/view_records.dart';

class TabsScreen extends StatefulWidget {
  late List<Map<String, String>> studentListDetails;

  TabsScreen(this.studentListDetails);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  var _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'title': 'Enter details',
        'page': const DetailsScreen(),
      },
      {
        'title': 'View records',
        'page': ViewRecords(widget.studentListDetails),
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: const TextStyle(color: Color.fromRGBO(19, 16, 57, 1)),
        ),
        backgroundColor: const Color.fromRGBO(77, 183, 153, 1),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: const Color.fromRGBO(77, 183, 153, 1),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromRGBO(19, 16, 57, 1),
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'View record',
          ),
        ],
      ),
    );
  }
}
