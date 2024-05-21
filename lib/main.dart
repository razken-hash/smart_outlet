import 'package:flutter/material.dart';
import 'package:smart_outlet/views/outlet_control_screen.dart';
import 'package:smart_outlet/views/settings_screen.dart';
import 'package:smart_outlet/views/smart_outlet_nav.dart';

void main() {
  runApp(const SmartOutletApp());
}

class SmartOutletApp extends StatelessWidget {
  const SmartOutletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SmartOutletNav(),
    );
  }
}
