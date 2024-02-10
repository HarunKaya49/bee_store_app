import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Color.fromARGB(50, 25, 155, 120),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Category",
          backgroundColor: Color.fromARGB(50, 25, 155, 120),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: "Orders",
          backgroundColor: Color.fromARGB(50, 25, 155, 120),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: "Profile",
          backgroundColor: Color.fromARGB(50, 25, 155, 120),
        ),
      ],
      selectedLabelStyle: TextStyle(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }
}
