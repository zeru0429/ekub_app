// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:ekub_app/common/constant/constant.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  UserProvider({required this.clien});
  final http.Client clien;
  //get all users
  Future<Map<String, dynamic>> getAllUsers(int skip, int take) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse('${ApiClient.baseUrl}user/get?take=$take&skip=$skip');
    try {
      final response = await ApiClient.getClient().get(
        url,
        headers: ApiClient.headers,
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return responseData;
      } else {
        return responseData;
      }
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  //get all users
  Future<Map<String, dynamic>> getSingleUsers(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse('${ApiClient.baseUrl}user/get/$id');
    try {
      final response = await ApiClient.getClient().get(
        url,
        headers: ApiClient.headers,
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return responseData;
      } else {
        return responseData;
      }
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  //deactivate user
  Future<Map<String, dynamic>> deactivateUser(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse("${ApiClient.baseUrl}user/deactivate/:$id");

    try {
      final response =
          await ApiClient.getClient().put(url, headers: ApiClient.headers);

      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonData;
      } else {
        return jsonData;
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  //  add new user
  Future<Map<String, dynamic>> addUser(Map<String, dynamic> json) async {
    await ApiClient.updateHeadersWithToken('token');
    final data = jsonEncode(json);
    final url = Uri.parse("${ApiClient.baseUrl}user/register");
    try {
      final response = await ApiClient.getClient()
          .post(url, headers: ApiClient.headers, body: data);
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return responseData;
      } else {
        return responseData;
      }
    } catch (e) {
      return {'success': false, 'message': "error occurred $e"};
    }
  }

  //  update profile
  Future<Map<String, dynamic>> updateUserProfile(
      Map<String, dynamic> json, int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final data = jsonEncode(json);
    final url = Uri.parse("${ApiClient.baseUrl}user/update/:$id");

    try {
      final response = await ApiClient.getClient()
          .put(url, headers: ApiClient.headers, body: data);

      final jsonData = jsonDecode(response.body);
      print(jsonData);
      if (response.statusCode == 200) {
        return jsonData;
      } else {
        return jsonData;
      }
    } catch (e) {
      print(e);
      return {"success": false, "message": e.toString()};
    }
  }
}
