import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://ecommerce.routemisr.com';

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception(
        'Failed to fetch data. Status code: ${response.statusCode}',
      );
    }
  }
}
