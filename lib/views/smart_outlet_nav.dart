import 'package:flutter/material.dart';
import 'package:smart_outlet/views/outlet_control_screen.dart';
import 'package:smart_outlet/views/settings_screen.dart';

class SmartOutletNav extends StatefulWidget {
  const SmartOutletNav({super.key});

  @override
  State<SmartOutletNav> createState() => _SmartOutletNavState();
}

class _SmartOutletNavState extends State<SmartOutletNav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Smart Outlet",
          ),
          backgroundColor: Colors.amber,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          backgroundColor: Colors.amber,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
        ),
        body: selectedIndex == 0
            ? const SmartOutletScreen()
            : const SettingsScreen());
  }
}
