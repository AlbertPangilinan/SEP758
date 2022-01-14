import 'package:flutter/material.dart';
import '../../../classes/ScreenArguments.dart';
import '../../../constants/colors.dart';

class TeamListEntry extends StatelessWidget {
  const TeamListEntry({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Map team;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightgrey,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(
            team["name"],
            style: TextStyle(fontSize: 18),
          ),
          trailing: Image.asset(
            'images/teams/${team["abbrev"]}.png',
            width: 64,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/team',
              arguments: ScreenArguments(team: team),
            );
          },
        ),
      ),
    );
  }
}
