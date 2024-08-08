// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:ekub_app/common/constant/constant.dart';
import 'package:http/http.dart' as http;

class WinnerProvider {
  final http.Client client;
  WinnerProvider({required this.client});
  // get all Winners
  Future<Map<String, dynamic>> getAllWinner(int skip, int take) async {
    final url =
        Uri.parse('${ApiClient.baseUrl}winner/get?take=$take&skip=$skip');
    await ApiClient.updateHeadersWithToken('token');
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
      return {'success': true, 'message': e.toString()};
      ;
    }
  }

  // get single winner
  Future<Map<String, dynamic>> getSingleWinner(int id) async {
    final url = Uri.parse('${ApiClient.baseUrl}winner/get/$id');
    await ApiClient.updateHeadersWithToken('token');
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
      return {'success': true, 'message': e.toString()};
      ;
    }
  }

  // add new winner
  Future<Map<String, dynamic>> addWinner(Map<String, dynamic> json) async {
    final data = jsonEncode(json);
    final url = Uri.parse("${ApiClient.baseUrl}winner/register");
    await ApiClient.updateHeadersWithToken('token');
    try {
      final response = await ApiClient.getClient()
          .post(url, headers: ApiClient.headers, body: data);

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

  //  update winner
  Future<Map<String, dynamic>> updateWinner(
      Map<String, dynamic> json, int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final data = jsonEncode(json);
    final url = Uri.parse("${ApiClient.baseUrl}winner/update/:$id");

    try {
      final response = await ApiClient.getClient()
          .put(url, headers: ApiClient.headers, body: data);

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

  // delete Winner
  Future<Map<String, dynamic>> deleteWinner(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse("${ApiClient.baseUrl}winner/delete/:$id");

    try {
      final response =
          await ApiClient.getClient().delete(url, headers: ApiClient.headers);

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
}
