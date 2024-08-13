// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:ekub_app/common/constant/constant.dart';
import 'package:http/http.dart' as http;

class CategoryProvider {
  final http.Client client;
  CategoryProvider({required this.client});
  // get all category
  Future<Map<String, dynamic>> getAllCategory(int skip, int take) async {
    await ApiClient.updateHeadersWithToken('token');
    final url =
        Uri.parse('${ApiClient.baseUrl}category/getAll?take=$take&skip=$skip');

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

  // get Single category detail
  Future<Map<String, dynamic>> getSingleCategory(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse('${ApiClient.baseUrl}category/getCategory/$id');
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

  //  add new Category
  Future<Map<String, dynamic>> addCategory(Map<String, dynamic> json) async {
    await ApiClient.updateHeadersWithToken('token');
    final url = Uri.parse('${ApiClient.baseUrl}category/register');
    final jsonString = jsonEncode(json);
    try {
      final response = await ApiClient.getClient().post(
        url,
        headers: ApiClient.headers,
        body: jsonString,
      );
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseData;
      } else {
        return throw Exception(responseData['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // update Category
  Future<Map<String, dynamic>> updateCategory(
      Map<String, dynamic> json, int id) async {
    final url = Uri.parse('${ApiClient.baseUrl}category/update/:$id');
    final jsonString = jsonEncode(json);
    await ApiClient.updateHeadersWithToken('token');
    try {
      final response = await ApiClient.getClient().put(
        url,
        headers: ApiClient.headers,
        body: jsonString,
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

  //  delete Category
  Future<Map<String, dynamic>> deleteCategory(int id) async {
    final url = Uri.parse('${ApiClient.baseUrl}category/delete/:$id');
    await ApiClient.updateHeadersWithToken('token');
    try {
      final response = await ApiClient.getClient().delete(
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
}
