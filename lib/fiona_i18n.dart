library fiona_i18n;

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

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

  Future<void> initialize({String locale="es"}) async {
    String jsonMessages;
    try{
      jsonMessages = await loadFile("i18n/messages_${locale.toLowerCase()}.json");
    }catch(e){
      jsonMessages = "";
    }
    if(jsonMessages.isEmpty){
      try{
        jsonMessages = await loadFile("i18n/messages.json");
      }catch(e){
        jsonMessages = "";
      }
    }
    if(jsonMessages.isNotEmpty){
      messages = json.decode(jsonMessages);
    }else{
      messages = {};
    }

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
