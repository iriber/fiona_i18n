library fiona_i18n;

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Fionai18n {
  late Map<String, dynamic> messages;

  Fionai18n._internal();

  static final Fionai18n _singleton = Fionai18n._internal();

  factory Fionai18n() {
    return _singleton;
  }

  Future<String> loadFile(String name) async {
    return await rootBundle.loadString('assets/$name');
  }

  Future<void> initialize(BuildContext context) async {
    String jsonMessages = "";
    Locale myLocale = Localizations.localeOf(context);
    switch (myLocale.languageCode.toLowerCase()) {
      case "es":
        {
          jsonMessages = await loadFile("i18n/messages_es.json");
        }
        break;
      case "en":
        {
          jsonMessages = await loadFile("i18n/messages_en.json");
        }
        break;
    }
    messages = json.decode(jsonMessages);
  }

  static String message(String key) {
    Map<String, dynamic> messages = Fionai18n().messages;
    String result = key;
    if (messages.containsKey(key)) {
      result = messages[key] ?? key;
    }
    return result;
  }
}
