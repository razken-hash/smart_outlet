import 'dart:convert';
import 'dart:developer';

void main() {
  String data = '{"a": "b", "c": "d"}';
  final Map<String, dynamic> map = jsonDecode(data);
  final String d = map["c"]!;
  print(d);
  print(map);
}
