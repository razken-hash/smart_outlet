import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:smart_outlet/constants.dart';

class ControlService {
  Future<void> turnOn() async {
    log("HELOO");
    await http.post(
      Uri.parse("$BASE_URL?status=on"),
    );
    log("HELOO");
  }

  Future<void> turnOff() async {
    await http.post(
      Uri.parse("$BASE_URL?status=off"),
    );
  }
}
