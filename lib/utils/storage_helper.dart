import 'dart:convert';

import 'package:chat_app/main.dart';
import 'package:chat_app/models/token_model.dart';
import 'package:chat_app/utils/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  SharedPreferences prefs;

  set setUUID(String uuid) {
    if (prefs == null || uuid == null || uuid == '') return;
    prefs.setString('uuid', uuid);
  }

  String getUUID() {
    if (prefs == null) return null;
    String uuid = prefs.getString('uuid');
    return uuid;
  }

  void removeUUID() {
    if (prefs == null) return;
    prefs.remove('uuid');
  }

  String getToken() {
    if (prefs == null) return null;
    String token = prefs.getString('token');
    var decoded = Functions.parseJwt(token);
    userData = TokenModel.fromJson(decoded);
    return token;
  }

  Future<void> setToken(String token) async {
    if (prefs == null || token == null || token == '') return;
    await prefs.setString('token', token);
    Map<String, dynamic> parsedToken = Functions.parseJwt(token);
    await prefs.setString('uuid', parsedToken['uuid']);
    await prefs.setString('user', parsedToken.toString());
  }

  Future<void> clearAuthData() async {
    if (prefs != null) {
      await prefs.remove('token');
      await prefs.remove('uuid');
      await prefs.remove('user');
    }
  }

  Future<TokenModel> getTokenData() async {
    String data = prefs.getString('user');
    return TokenModel.fromJson(data is String ? jsonDecode(data) : data);
  }
}
