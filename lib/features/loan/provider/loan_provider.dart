// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:ekub_app/common/constant/constant.dart';
import 'package:http/http.dart' as http;

class LoanProvider {
  LoanProvider({required this.client});
  final http.Client client;
  // get all loans
  Future<Map<String, dynamic>> getAllLone(int skip, int take) async {
    await ApiClient.updateHeadersWithToken('token');
    final url =
        Uri.parse('${ApiClient.baseUrl}loan/getAll?take=$take&skip=$skip');
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
    }
  }

  // get single loan
  Future<Map<String, dynamic>> getSingleLone(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse('${ApiClient.baseUrl}loan/get/$id');
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
    }
  }

  // add new Loan
  Future<Map<String, dynamic>> addLoan(Map<String, dynamic> json) async {
    await ApiClient.updateHeadersWithToken('token');
    final data = jsonEncode(json);
    final url = Uri.parse("${ApiClient.baseUrl}loan/register");

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

  // update loan
  Future<Map<String, dynamic>> updateLoan(
      Map<String, dynamic> json, int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final data = jsonEncode(json);
    final url = Uri.parse("${ApiClient.baseUrl}loan/update/:$id");

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

  //delete loan
  Future<Map<String, dynamic>> deleteLoan(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse("${ApiClient.baseUrl}loan/delete/:$id");

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
