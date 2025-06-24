import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = 'http://YOUR_BACKEND_IP:5000';

  static Future<UserModel> login(String phone) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone': phone}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Login failed');
    }
  }

  static Future<UserModel> signup(String name, String email, String phone) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'phone': phone}),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Signup failed');
    }
  }
}