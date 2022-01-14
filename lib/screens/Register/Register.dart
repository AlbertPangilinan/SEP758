import 'package:finalproject/constants/colors.dart';
import 'package:flutter/material.dart';
import 'widgets/RegisterForm.dart';
import '../../constants/colors.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkgrey,
      body: RegisterForm(),
    );
  }
}
