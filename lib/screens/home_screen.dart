import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  final UserModel user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final daysLeft = user.isTrialActive
        ? user.trialEnd.difference(DateTime.now()).inDays
        : 0;

    return Scaffold(
      appBar: AppBar(title: Text('Welcome, \${user.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Wallet Balance: ₹\${user.wallet}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            if (user.isTrialActive)
              Card(
                color: Colors.green[100],
                child: ListTile(
                  title: Text('🆓 Play-for-Free Period'),
                  subtitle: Text('\$daysLeft days remaining'),
                ),
              ),
            if (!user.isTrialActive)
              Card(
                color: Colors.orange[100],
                child: ListTile(
                  title: Text('💰 Real Money Mode'),
                  subtitle: Text('You can now play on paid tables'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}