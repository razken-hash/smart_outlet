import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smart_outlet/providers/components_controller.dart';
import 'package:smart_outlet/providers/record_controller.dart';
import 'package:smart_outlet/providers/ai_controller.dart';

class SmartOutletScreen extends StatelessWidget {
  const SmartOutletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ComponentsController>(
      builder: (context, componentsController, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Consumer<AudioController>(builder: (context, audioController, child) {
            //   return Consumer<AiController>(
            //       builder: (context, aiController, child) {
            //     return GestureDetector(
            //       onLongPress: () {
            //         log("Start Record");
            //         audioController.listen();
            //       },
            //       onLongPressEnd: (details) async {
            //         log("Start Record");

            //         String? audio = await audioController.pause();
            //         if (audio != null) {
            //           Uint8List sound = await audioController.getVoice();
            //           await aiController.classifySound(sound);
            //         }
            //       },
            //       child: Container(
            //         width: 40.0,
            //         height: 40.0,
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             width: 1.0,
            //             color: Colors.amber,
            //           ),
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: const Icon(Icons.spatial_audio),
            //       ),
            //     );
            //   });
            // }),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Image.asset(
            //     "assets/images/lamp_off.png",
            //     width: componentsController.ledStatus.name == "on"
            //         ? MediaQuery.of(context).size.width
            //         : 235,
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
            // if (componentsController.ledStatus == ComponentStatus.on)
            //   Align(
            //     alignment: Alignment.center,
            //     child: Container(
            //       width: 300,
            //       decoration: const BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage("assets/images/light.png"),
            //         ),
            //         shape: BoxShape.circle,
            //       ),
            //     ),
            //   ),

            const Spacer(),
            const Center(
              child: Text(
                "Control your devices with OneClick",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            TextButton.icon(
              label: Text(componentsController.ledStatus.name.toUpperCase()),
              icon: Icon(
                componentsController.ledStatus == ComponentStatus.on
                    ? Icons.lightbulb
                    : Icons.lightbulb_outline_rounded,
                size: 45,
              ),
              style: TextButton.styleFrom(
                backgroundColor:
                    componentsController.ledStatus == ComponentStatus.on
                        ? Colors.amber
                        : Colors.amberAccent,
                textStyle: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                fixedSize: const Size(250, 150),
              ),
              onPressed: () async {
                componentsController.switchState(Component.led);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
              label: Text(componentsController.plugStatus.name.toUpperCase()),
              icon: Icon(
                componentsController.plugStatus == ComponentStatus.on
                    ? Icons.electrical_services_outlined
                    : Icons.electric_bolt_rounded,
                size: 45,
              ),
              style: TextButton.styleFrom(
                backgroundColor:
                    componentsController.plugStatus == ComponentStatus.on
                        ? Colors.amber
                        : Colors.amberAccent,
                textStyle: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                fixedSize: const Size(250, 150),
              ),
              onPressed: () async {
                componentsController.switchState(Component.plug);
              },
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
