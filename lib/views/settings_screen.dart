import 'package:flutter/material.dart';
import 'package:wifi_flutter/wifi_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    loadWifi();
  }

  Iterable<WifiNetwork> networks = [];

  void loadWifi() async {
    Iterable<WifiNetwork> nets = await WifiFlutter.scanNetworks();
    setState(() {
      networks = nets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Settings Screen\n ${networks.length}"),
          ),
        ],
      ),
    );
  }
}
