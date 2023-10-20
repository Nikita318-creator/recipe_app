import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:new_recipes/features/main_home/domain/models/requests_data.dart';

// ignore: avoid_print_all
class ApiClient {
  const ApiClient({required this.requestsData});

  final RequestsData requestsData;

  Future<int> getData() async {
    final response = await http.get(Uri.parse(requestsData.getUrl));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    final randomRequest = Random().nextInt(requestsData.statusCodesMoc.length);
    return randomRequest;
    // return response.statusCode;
  }

  Future<int> sendData() async {
    final response = await http.post(
      Uri.parse(requestsData.postUrl),
      body: jsonEncode(requestsData.payload),
      headers: requestsData.headers,
    );
    if (response.statusCode == 201) {
      print('Data sent successfully.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    // return response.statusCode;
    final randomRequest = requestsData
        .statusCodesMoc[Random().nextInt(requestsData.statusCodesMoc.length)];
    return randomRequest;
  }
}
