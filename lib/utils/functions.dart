import 'dart:convert';

import 'package:intl/intl.dart';

class Functions {
  static void nextTick(Function callback, [int milliseconds = 0]) {
    // FIXME:
    Future.delayed(Duration(milliseconds: 10)).then((_) {
      callback();
    });
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  //jwt
  static Map<String, dynamic> parseJwt(String token) {
    if (token != null && token.isNotEmpty && token != '') {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('invalid token');
      }

      final payload = _decodeBase64(parts[1]);
      final payloadMap = jsonDecode(payload);
      if (payloadMap is! Map<String, dynamic>) {
        throw Exception('invalid payload');
      }

      return payloadMap;
    } else {
      return {"Hata": "Token Data Boş"};
    }
  }

  static parseDate(String date) {
    try {
      var d = DateTime.tryParse(date);
      return DateFormat("d MMMM H:m").format(d);
    } catch (e) {
      print(e);
    }
  }
}
