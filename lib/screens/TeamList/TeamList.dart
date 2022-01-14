import 'package:flutter/material.dart';
import 'widgets/TeamListEntry.dart';
import '../NestedScreen.dart';
import '../../classes/ScreenArguments.dart';

class TeamList extends StatelessWidget {
  const TeamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    List<TeamListEntry> teamlist = [];

    for (dynamic team in args.teams!) {
      teamlist.add(TeamListEntry(team: team));
    }

    return NestedScreen(
      title: 'Teams',
      child: ListView(children: teamlist),
      args: args,
    );
  }
}
