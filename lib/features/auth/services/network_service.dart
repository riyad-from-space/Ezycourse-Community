import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl;

  NetworkService({required this.baseUrl});

  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final defaultHeaders = {'Content-Type': 'application/json', ...?headers};
    return await http.post(
      url,
      headers: defaultHeaders,
      body: jsonEncode(body ?? {}),
    );
  }

  // Future<http.Response> get(
  //   String endpoint, {
  //   Map<String, String>? headers,
  // }) async {
  //   final url = Uri.parse('$baseUrl$endpoint');
  //   final defaultHeaders = {'Content-Type': 'application/json', ...?headers};
  //   return await http.get(url, headers: defaultHeaders);
  // }
}
