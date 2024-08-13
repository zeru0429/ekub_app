// ignore_for_file: depend_on_referenced_packages

import 'package:ekub_app/utils/share_preference.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static String baseUrl = "http://192.168.0.71:8888/api/";
  static http.Client client = http.Client();

  static http.Client getClient() {
    return client;
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Origin': 'https://localhost:4444'
  };

  static Future<void> updateHeadersWithToken(String name) async {
    final token = await LocalDataStore.getDataString(name);
    if (token != null) {
      headers['Authorization'] = token;
    } else {
      headers.remove('Authorization');
    }
  }
}
