import 'package:flutter/material.dart';

class SmartOutletScreen extends StatefulWidget {
  const SmartOutletScreen({super.key});

  @override
  State<SmartOutletScreen> createState() => _SmartOutletScreenState();
}

class _SmartOutletScreenState extends State<SmartOutletScreen> {
  List<bool> status = List.generate(4, (index) => false);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 100,
              maxHeight: 200,
            ),
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              childAspectRatio: 10 / 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(
                4,
                (index) => TextButton.icon(
                  label: Text(
                    status[index] ? "ON" : "OFF",
                  ),
                  icon: Icon(status[index]
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline_rounded),
                  style: TextButton.styleFrom(
                      backgroundColor:
                          status[index] ? Colors.amber : Colors.amberAccent,
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      fixedSize: const Size(300, 60)),
                  onPressed: () {
                    setState(() {
                      status[index] = !status[index];
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
