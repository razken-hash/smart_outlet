import 'package:flutter/material.dart';
import 'package:smart_outlet/views/outlet_control_screen.dart';
import 'package:smart_outlet/views/settings_screen.dart';

class SmartOutletNav2 extends StatefulWidget {
  const SmartOutletNav2({super.key});

  @override
  State<SmartOutletNav2> createState() => _SmartOutletNav2State();
}

class _SmartOutletNav2State extends State<SmartOutletNav2> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color(0xFF2B3B31),
        appBar: AppBar(
          title: const Text(
            "BRIGHTLET",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
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
