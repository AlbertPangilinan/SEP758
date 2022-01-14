import 'package:flutter/material.dart';

class UserCredentials extends StatelessWidget {
  const UserCredentials({
    Key? key,
    required this.username,
    required this.email,
  }) : super(key: key);

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 32),
          child: Text(
            'Username: $username',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Email: $email',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
