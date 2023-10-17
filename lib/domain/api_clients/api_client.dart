import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class ApiClient {
  List<int> statusCodesMoc = [200, 201, 202, 203, 204, 400, 404, 500];

  Future<int> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    // int randomNumber = Random().nextInt(statusCodesMoc.length);
    // return randomNumber;
    return 404;
    // return response.statusCode;
  }

  Future<int> sendData() async {
    int randomNumber = Random().nextInt(statusCodesMoc.length);

    final payload = {'name': 'John Doe', 'email': 'johndoe@example.com'};
    final response = await http.post(
      Uri.parse('https://example.com/api/users'),
      body: jsonEncode(payload),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      print('Data sent successfully.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return response.statusCode;
    // return randomNumber;
  }
}
