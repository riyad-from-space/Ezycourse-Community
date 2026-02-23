import 'dart:async';
import 'dart:io';

import 'package:ezycourse_community/core/errors/app_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService {
  NetworkService();

  Future<http.Response> post({
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? token,
    required String url,
  }) async {
    try {
      final defaultHeaders = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
        ...?headers,
      };

      final response = await http
          .post(
            Uri.parse(url),
            headers: defaultHeaders,
            body: jsonEncode(body ?? {}),
          )
          .timeout(const Duration(seconds: 30));

      return response;
    } on SocketException {
      throw const AppException('No internet connection');
    } on TimeoutException {
      throw const AppException('Request timeout. Please try again');
    } on HttpException {
      throw const AppException('Server error');
    } catch (e) {
      if (e is AppException) rethrow;
      throw AppException('Unexpected error: ${e.toString()}');
    }
  }

  Future<http.Response> get({
    String? token,
    Map<String, String>? headers,
    required String url,
  }) async {
    try {
      final uriUrl = Uri.parse(url);
      final defaultHeaders = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
        ...?headers,
      };
      final response = await http
          .get(uriUrl, headers: defaultHeaders)
          .timeout(const Duration(seconds: 30));

      return response;
    } on SocketException {
      throw const AppException('No internet connection');
    } on TimeoutException {
      throw const AppException('Request timeout. Please try again');
    } on HttpException {
      throw const AppException('Server error');
    } catch (e) {
      if (e is AppException) rethrow;
      throw AppException('Unexpected error: ${e.toString()}');
    }
  }
}
