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
}
