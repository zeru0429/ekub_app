// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:ekub_app/common/constant/constant.dart';
import 'package:http/http.dart' as http;

class LotteryProvider {
  LotteryProvider({required this.client});
  final http.Client client;
  // get all lotterys
  Future<Map<String, dynamic>> getAllLot(int skip, int take) async {
    await ApiClient.updateHeadersWithToken('token');
    final url =
        Uri.parse('${ApiClient.baseUrl}lot/getAllLot?take=$take&skip=$skip');
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

  // get single lottery
  Future<Map<String, dynamic>> getSingleLot(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse('${ApiClient.baseUrl}lot/getLot/$id');
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

  // add lottery
  Future<Map<String, dynamic>> addLot(Map<String, dynamic> json) async {
    await ApiClient.updateHeadersWithToken('token');
    final data = jsonEncode(json);
    final url = Uri.parse("${ApiClient.baseUrl}lot/register");
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

  // update lottery profile
  Future<Map<String, dynamic>> updateLotProfile(
      Map<String, dynamic> json, int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final data = jsonEncode(json);
    final url = Uri.parse("${ApiClient.baseUrl}lot/updateProfile/:$id");
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

  // delete lottery
  Future<Map<String, dynamic>> deleteLot(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse("${ApiClient.baseUrl}lot/deleteLot/:$id");
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
