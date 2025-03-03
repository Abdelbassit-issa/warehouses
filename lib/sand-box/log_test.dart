import 'package:flutter/material.dart';

class LogTest extends StatefulWidget {
  final Map<String, dynamic> userProfile;
  const LogTest({super.key, required this.userProfile});

  @override
  State<LogTest> createState() => _LogTestState();
}

class _LogTestState extends State<LogTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.userProfile['name']),
            const SizedBox(height: 16),
            Text(widget.userProfile['phone_number']),
            const SizedBox(height: 16),

            Text(widget.userProfile['id_number']),
          ],
        ),
      ),
    );
  }
}
