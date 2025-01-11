library fiona_i18n;

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// This class manage the i18n messages
class Fionai18n {
  ///the loaded messages
  late Map<String, dynamic> messages;

  ///private constructor for singleton
  Fionai18n._internal();

  /// singleton instance
  static final Fionai18n _singleton = Fionai18n._internal();

  ///class factory
  factory Fionai18n() {
    return _singleton;
  }

  ///Loads a file from its name
  Future<String> loadFile(String name) async {
    return await rootBundle.loadString('assets/$name');
  }

  /// Initializes messages for the locale
  Future<void> initialize({String locale = "es"}) async {
    String jsonMessages;
    try {
      jsonMessages =
          await loadFile("i18n/messages_${locale.toLowerCase()}.json");
    } catch (e) {
      jsonMessages = "";
    }
    if (jsonMessages.isEmpty) {
      try {
        jsonMessages = await loadFile("i18n/messages.json");
      } catch (e) {
        jsonMessages = "";
      }
    }
    if (jsonMessages.isNotEmpty) {
      messages = json.decode(jsonMessages);
    } else {
      messages = {};
    }
  }

  /// Returns an i18n message
  static String message(String key) {
    Map<String, dynamic> messages = Fionai18n().messages;
    String result = key;
    if (messages.containsKey(key)) {
      result = messages[key] ?? key;
    }
    return result;
  }
}
