import 'package:flutter/material.dart';
import 'package:warehouses/models/user_profile.dart';

class LogTest extends StatefulWidget {
  final UserProfileModel userProfile;
  const LogTest({super.key, required this.userProfile});

  @override
  State<LogTest> createState() => _LogTestState();
}

class _LogTestState extends State<LogTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.userProfile.name),
          const SizedBox(height: 16),
          Text(widget.userProfile.email),
          const SizedBox(height: 16),

          Text(widget.userProfile.phoneNumber),
        ],
      ),
    );
  }
}
