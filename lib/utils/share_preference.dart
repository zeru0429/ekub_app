import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStore {
  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  //retrieve data
  static Future<String?> getDataString(String key) =>
      getInstance().then((value) => value.getString(key));

  // store data
  static Future<void> storeDataString(String key, String value) async {
    getInstance().then((e) {
      e.setString(key, value);
    });
  }

  //remove data String
  static Future<void> removeDataString(String key) async {
    getInstance().then((e) {
      e.remove(key);
    });
  }
}
