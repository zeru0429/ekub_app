// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:ekub_app/common/constant/constant.dart';
import 'package:ekub_app/features/deposit/model/deposit_model.dart';
import 'package:http/http.dart' as http;

class DepositProvider {
  DepositProvider({required this.client}) {
    ApiClient.updateHeadersWithToken('token');
  }

  final http.Client client;

  //get list of deposit
  Future<Map<String, dynamic>> getDeposits(int skip, int take) async {
    await ApiClient.updateHeadersWithToken('token');
    try {
      final url = Uri.parse(
          "${ApiClient.baseUrl}/deposit/getAll?take=$take&skip=$skip");
      final response = await client.get(url, headers: ApiClient.headers);
      final responseBody = jsonDecode(response.body);

      return responseBody;
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  //get single deposit detail
  Future<Map<String, dynamic>> getSingleDepositsDetail(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    try {
      final url = Uri.parse("${ApiClient.baseUrl}/deposit/get/$id");
      final response = await client.get(url, headers: ApiClient.headers);
      final responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  //create deposit
  Future<Map<String, dynamic>> createDeposits(DepositModel deposit) async {
    await ApiClient.updateHeadersWithToken('token');
    try {
      final url = Uri.parse("${ApiClient.baseUrl}/deposit/register");
      final body = jsonEncode(deposit.toJson());
      final response =
          await client.post(url, headers: ApiClient.headers, body: body);
      final responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  //update deposit
  Future<Map<String, dynamic>> updateDeposits(
      DepositModel deposit, int id) async {
    await ApiClient.updateHeadersWithToken('token');
    try {
      final url = Uri.parse("${ApiClient.baseUrl}/deposit/update/$id");
      final body = jsonEncode(deposit.toJson());
      final response =
          await client.put(url, headers: ApiClient.headers, body: body);
      final responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  //delete deposit
  Future<Map<String, dynamic>> deleteDeposits(int id) async {
    await ApiClient.updateHeadersWithToken('token');
    try {
      final url = Uri.parse("${ApiClient.baseUrl}/deposit/delete/$id");
      final response = await client.delete(url, headers: ApiClient.headers);
      final responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
}
