import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  @protected
  final String _baseUrl =
      'https://peaceful-alien-indirectly.ngrok-free.app/api/';

  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final response =
        await http.get(Uri.parse('$_baseUrl$endpoint'), headers: headers);
    log('status ${response.statusCode} ${response.body}');
    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: _prepareHeaders(headers),
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> put(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final response = await http.put(
      Uri.parse('$_baseUrl$endpoint'),
      headers: _prepareHeaders(headers),
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> delete(String endpoint,
      {Map<String, String>? headers}) async {
    final response =
        await http.delete(Uri.parse('$_baseUrl$endpoint'), headers: headers);
    return _handleResponse(response);
  }

  Map<String, String> _prepareHeaders(Map<String, String>? headers) {
    return {
      'Content-Type': 'application/json',
      ...?headers,
    };
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }
}
