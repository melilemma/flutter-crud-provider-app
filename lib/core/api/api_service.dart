import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/users';

  // READ
  Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }

  // CREATE
  Future<void> addUser(String name, String job) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'job': job,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create user');
    }
  }

  // UPDATE
  Future<void> updateUser(String id, String name, String job) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'job': job,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }

  // DELETE
  Future<void> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
} 