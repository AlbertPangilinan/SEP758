import 'package:flutter/material.dart';
import '../../../classes/ScreenArguments.dart';
import '../../../constants/colors.dart';

class RegionListEntry extends StatelessWidget {
  const RegionListEntry({
    Key? key,
    required this.name,
    required this.abbrev,
    required this.teams,
  }) : super(key: key);

  final String name;
  final String abbrev;
  final List<Object?> teams;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightgrey,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
        trailing: Text(
          abbrev,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/teamlist',
            arguments: ScreenArguments(
              region: abbrev,
              teams: teams,
            ),
          );
        },
      ),
    );
  }
}
