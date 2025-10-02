import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // When using Android emulator to reach host machine, use 10.0.2.2
  static const String baseUrl = 'http://10.0.2.2:3001/api';

  static Future<List<dynamic>> getExams() async {
    final url = Uri.parse('$baseUrl/exams');
    try {
      final response = await http.get(url, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'] ?? [];
      }
      throw Exception('Failed with ${response.statusCode}: ${response.body}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<List<dynamic>> getResourcesByCourseCode(String code) async {
    final url = Uri.parse('$baseUrl/resources/by-code/$code');
    try {
      final response = await http.get(url, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'] ?? [];
      }
      throw Exception('Failed with ${response.statusCode}: ${response.body}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
