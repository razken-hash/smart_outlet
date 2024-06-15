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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Old Devices",
                  style: TextStyle(fontSize: 30),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              insetPadding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    height: 70,
                                    width: 160,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "SSID",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    height: 70,
                                    width: 160,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.amberAccent,
                                      textStyle: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      fixedSize: const Size(180, 50),
                                    ),
                                    child: const Text("Connect"),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ));
                  },
                  icon: const CircleAvatar(
                    radius: 20,
                    foregroundColor: Colors.amber,
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const ListTile(
              title: Text("NodeMCU"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Connected",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.wifi,
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text("NodeMCU-1"),
              trailing: Icon(
                Icons.wifi_off,
              ),
            ),
            const ListTile(
              title: Text("NodeMCU-2"),
              trailing: Icon(
                Icons.wifi_off,
              ),
            ),
            // const Spacer(),
            // Center(
            //   child: TextButton.icon(
            //     label: const Text("Connect"),
            //     icon: const Icon(
            //       Icons.explicit_outlined,
            //       size: 25,
            //     ),
            //     style: TextButton.styleFrom(
            //       backgroundColor: Colors.amberAccent,
            //       textStyle: const TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       fixedSize: const Size(180, 80),
            //     ),
            //     onPressed: () async {

            //       // componentsController.switchState(Component.plug);
            //     },
            //   ),
            // ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
