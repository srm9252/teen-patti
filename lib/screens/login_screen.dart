import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/user_model.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  bool isLoading = false;

  void handleLogin() async {
    setState(() => isLoading = true);
    try {
      final user = await ApiService.login(phoneController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen(user: user)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : handleLogin,
              child: isLoading ? CircularProgressIndicator() : Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}