// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:ekub_app/common/constant/constant.dart';
import 'package:ekub_app/features/login/model/login_model.dart';
import 'package:http/http.dart' as http;

class LoginProvider {
  final http.Client client;
  LoginProvider({required this.client});
  Future<Map<String, dynamic>> login(LoginModel loginModel) async {
    try {
      final url = Uri.parse("${ApiClient.baseUrl}/user/login");
      final data = jsonEncode(loginModel.toJson());
      final response =
          await client.post(url, body: data, headers: ApiClient.headers);

      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseBody;
      } else {
        throw Exception(responseBody["message"]);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
