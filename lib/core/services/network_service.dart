import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  NetworkException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class NetworkService {
  final String baseUrl;

  NetworkService({required this.baseUrl});

  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');

      final defaultHeaders = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
        ...?headers,
      };

      final response = await http
          .post(url, headers: defaultHeaders, body: jsonEncode(body ?? {}))
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => throw NetworkException("Request timeout"),
          );

      return response;
    } on SocketException {
      throw NetworkException("No internet connection");
    } on HttpException {
      throw NetworkException("Server error");
    } catch (e) {
      throw NetworkException("Unexpected error: ${e.toString()}");
    }
  }

  Future<dynamic> get( {String? endpoint,String? token,Map<String, String>? headers,})async{
    try{
      final url = Uri.parse('$baseUrl$endpoint');
      final defaultHeaders = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
        ...?headers,
      };
      final response = await http
          .get(url, headers: defaultHeaders,)
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => throw NetworkException("Request timeout"),
          );

          return response;


    }catch(e){
      throw NetworkException("Unexpected error: ${e.toString()}");

    }

  }
}
