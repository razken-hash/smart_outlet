// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_tflite/flutter_tflite.dart';

// class AiController extends ChangeNotifier {
//   Future<List<Map<String, dynamic>>> classifySound(Uint8List sound) async {
//     await loadModel();
//     List<dynamic>? output = await Tflite.runModelOnBinary(
//       binary: sound,
//       numResults: 3,
//       threshold: 0.1,
//     );
//     await Future.delayed(const Duration(seconds: 2));
//     List<Map<String, dynamic>> data = [];
//     for (var item in output!) {
//       data.add({
//         'label':
//             '${item['index'].toString().padRight(3, ' ')} ${item['label'].toString().replaceAll('"', '')}',
//         'confidence': (double.parse(item['confidence'].toString()) * 10000)
//                 .roundToDouble() /
//             100,
//       });
//     }
//     Tflite.close();
//     return data;
//   }

//   Future<void> loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/tflite/sound_model.tflite",
//       labels: "assets/tflite/sound_labels.txt",
//     );
//   }
// }
