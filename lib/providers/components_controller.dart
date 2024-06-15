import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_outlet/constants.dart';

class ComponentsController extends ChangeNotifier {
  ComponentStatus ledStatus = ComponentStatus.on;
  ComponentStatus plugStatus = ComponentStatus.on;

  void switchState(Component component) async {
    if (component == Component.led) {
      ledStatus = ledStatus == ComponentStatus.on
          ? ComponentStatus.off
          : ComponentStatus.on;
    }
    if (component == Component.plug) {
      plugStatus = plugStatus == ComponentStatus.on
          ? ComponentStatus.off
          : ComponentStatus.on;
    }

    String url = "$BASE_URL?led1=${plugStatus.name}&led2=${ledStatus.name}";
    log(url);
    await http.post(Uri.parse(url));
    notifyListeners();
  }
}

enum ComponentStatus { on, off }

enum Component { led, plug }
