import 'package:flutter/material.dart';
import '../../../classes/Team.dart';
import '../../../constants/colors.dart';

class Roster extends StatelessWidget {
  const Roster({
    Key? key,
    required this.players,
    this.sub,
    this.coach,
  }) : super(key: key);

  final List<TeamMember> players;
  final TeamMember? sub;
  final TeamMember? coach;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [];
    List<Widget> _bench = [];

    for (TeamMember member in players) {
      _children.add(
        Container(
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                member.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  'images/countries/${member.country}.png',
                  width: 64,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (sub != null) {
      _bench.add(Container(
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sub: ${sub?.name ?? ''}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                'images/countries/${sub?.country}.png',
                width: 64,
              ),
            ),
          ],
        ),
      ));
    }

    if (coach != null) {
      _bench.add(Container(
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Coach: ${coach?.name ?? ''}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                'images/countries/${coach?.country}.png',
                width: 64,
              ),
            ),
          ],
        ),
      ));
    }

    _children.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _bench,
      ),
    );

    return Container(
      color: lightgrey,
      margin: EdgeInsets.all(16),
      child: Column(children: _children),
    );
  }
}
