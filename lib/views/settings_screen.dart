import 'package:flutter/material.dart';
import 'package:smart_outlet/wifi/wifi_connector.dart';
// import 'package:wifi_flutter/wifi_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    // loadWifi();
  }

  // Iterable<WifiNetwork> networks = [];

  // void loadWifi() async {
  //   Iterable<WifiNetwork> nets = await WifiFlutter.scanNetworks();
  //   setState(() {
  //     networks = nets;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text("Settings Screen\n"),
          ),
          TextButton(
            onPressed: () {
              // WifiConnector.connectWifi("not exist", "noway");
              WifiConnector.connectWifi("Kelvin Kiptum", "2:00:35 (WR)");
            },
            child: const Text("Connect To WIFI"),
          ),
        ],
      ),
    );
  }
}
