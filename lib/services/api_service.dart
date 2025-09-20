import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3001/api';

  static Future<List<dynamic>> getExams() async {
    print('🔗 Attempting to connect to: $baseUrl/public/exams');

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/public/exams'),
        headers: {'Content-Type': 'application/json'},
      );

      print('📡 Response status: ${response.statusCode}');
      print('📄 Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('✅ Successfully fetched ${data['data']?.length ?? 0} exams');
        return data['data'] ?? [];
      } else {
        print('❌ Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load exams');
      }
    } catch (e) {
      print('💥 Exception: $e');
      throw Exception('Error: $e');
    }
  }
}
