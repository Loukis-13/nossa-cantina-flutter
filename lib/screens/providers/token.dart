import 'package:flutter/foundation.dart';

class Token with ChangeNotifier, DiagnosticableTreeMixin {
  String _token = "";

  String get token => _token;

  void increment() {
    _token = "JWT";
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('token', token));
  }
}