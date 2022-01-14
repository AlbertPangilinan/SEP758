import 'package:finalproject/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class TeamLogo extends StatelessWidget {
  const TeamLogo({
    Key? key,
    required this.name,
    required this.abbrev,
  }) : super(key: key);

  final String name;
  final String abbrev;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      margin: EdgeInsets.all(8),
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset(
            'images/teams/$abbrev.png',
            width: MediaQuery.of(context).size.width / 2,
          )),
    );
  }
}
