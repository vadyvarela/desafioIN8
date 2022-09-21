import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = "http://localhost:4003";

  static Future addVeiculos(Map<String, dynamic> body, url) async {
    Uri requestUri = Uri.parse(baseUrl + url);
    var response = await http.post(
      requestUri,
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
      },
    );
    var decode = jsonDecode(response.body);
    return decode;
  }
  static Future listVeiculos(url) async {
    Uri requestUri = Uri.parse(baseUrl + url);
    var response = await http.get(
      requestUri,
      headers: {
        "Content-Type": "application/json",
      },
    );
    var decode = jsonDecode(response.body);
    return decode;
  }

  static Future addCompra(Map<String, dynamic> body, url) async {
    Uri requestUri = Uri.parse(baseUrl + url);
    print(body);
    var response = await http.post(
      requestUri,
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
      },
    );
    var decode = jsonDecode(response.body);
    return decode;
  }
  static Future listCompra(url) async {
    Uri requestUri = Uri.parse(baseUrl + url);
    var response = await http.get(
      requestUri,
      headers: {
        "Content-Type": "application/json",
      },
    );
    var decode = jsonDecode(response.body);
    return decode;
  }

  static Future addVenda(Map<String, dynamic> body, url) async {
    Uri requestUri = Uri.parse(baseUrl + url);
    var response = await http.post(
      requestUri,
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
      },
    );
    var decode = jsonDecode(response.body);
    return decode;
  }
  static Future listVenda(url) async {
    Uri requestUri = Uri.parse(baseUrl + url);
    var response = await http.get(
      requestUri,
      headers: {
        "Content-Type": "application/json",
      },
    );
    var decode = jsonDecode(response.body);
    return decode;
  }

}
