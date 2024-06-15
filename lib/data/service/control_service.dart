import 'package:http/http.dart' as http;
import 'package:smart_outlet/constants.dart';

class ControlService {
  static Future<void> turnOn() async {
    await http.post(
      Uri.parse("$BASE_URL?led1=on&led2=on"),
    );
  }

  static Future<void> turnOff() async {
    await http.post(
      Uri.parse("$BASE_URL?led1=off&led2=off"),
    );
  }
}
