// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';

// class AudioController extends ChangeNotifier {
//   final record = Record();

//   void listen() async {
//     if (await record.hasPermission()) {
//       final path = await getExternalStorageDirectory();
//       await record.start(
//         path: join(path!.path, 'sound.mp3'),
//         encoder: AudioEncoder.aacLc,
//         bitRate: 128000,
//         samplingRate: 44100,
//       );
//     }
//   }

//   Future<Uint8List> getVoice() async {
//     // Get the external storage directory
//     final directory = await getExternalStorageDirectory();

//     if (directory == null) {
//       throw Exception("External storage directory not found");
//     }

//     // Construct the path to the audio file
//     final voicePath = join(directory.path, 'sound.m4a');

//     // Read the file as bytes
//     final file = File(voicePath);

//     if (!file.existsSync()) {
//       throw Exception("File not found at $voicePath");
//     }

//     // Return the file content as Uint8List
//     final bytes = await file.readAsBytes();
//     return bytes;
//   }

//   Future<String?> pause() async {
//     return await record.stop();
//   }
// }
