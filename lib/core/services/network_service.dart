import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

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
            onTimeout: () => throw NetworkException('Request timeout'),
          );

      return response;
    } on SocketException {
      throw NetworkException('No internet connection');
    } on HttpException {
      throw NetworkException('Server error occurred');
    } catch (e) {
      throw NetworkException('Unexpected error: ${e.toString()}');
    }
  }

  /// GET request with optional authentication token
  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    String? token,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final defaultHeaders = {
        'Content-Type': 'application/json',
        if (token != null)
          'Authorization': 'Bearer $token', // Add token if provided
        ...?headers,
      };

      return await http
          .get(url, headers: defaultHeaders)
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => throw NetworkException('Request timeout'),
          );
    } on SocketException {
      throw NetworkException('No internet connection');
    } on HttpException {
      throw NetworkException('Server error occurred');
    } catch (e) {
      throw NetworkException('Unexpected error: ${e.toString()}');
    }
  }
}
