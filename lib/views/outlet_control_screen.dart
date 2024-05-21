import 'package:flutter/material.dart';
import 'package:smart_outlet/data/service/control_service.dart';

class SmartOutletScreen extends StatefulWidget {
  const SmartOutletScreen({super.key});

  @override
  State<SmartOutletScreen> createState() => _SmartOutletScreenState();
}

class _SmartOutletScreenState extends State<SmartOutletScreen> {
  List<bool> status = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onPressed: () async {
                  final service = ControlService();
                  if (!status[index]) {
                    await service.turnOn();
                  } else {
                    await service.turnOff();
                  }
                  setState(() {
                    status[index] = !status[index];
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
