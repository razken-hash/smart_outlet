import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_outlet/providers/ai_controller.dart';
import 'package:smart_outlet/providers/components_controller.dart';
import 'package:smart_outlet/providers/record_controller.dart';
import 'package:smart_outlet/views/smart_outlet_nav%20copy.dart';
import 'package:smart_outlet/views/smart_outlet_nav.dart';

void main() {
  runApp(const SmartOutletApp());
}

class SmartOutletApp extends StatelessWidget {
  const SmartOutletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ComponentsController>(
          create: (context) => ComponentsController(),
        ),
        // ChangeNotifierProvider<AudioController>(
        //   create: (context) => AudioController(),
        // ),
        // ChangeNotifierProvider<AiController>(
        //   create: (context) => AiController(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "ElMessiri"),
        home: const SmartOutletNav(),
      ),
    );
  }
}
