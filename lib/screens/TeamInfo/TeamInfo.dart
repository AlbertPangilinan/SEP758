import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'widgets/Roster.dart';
import 'widgets/TeamLogo.dart';
import '../NestedScreen.dart';
import '../../classes/Team.dart';
import '../../classes/ScreenArguments.dart';

class TeamInfo extends StatelessWidget {
  const TeamInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    createTeam(_data) {
      TeamMember player1 = TeamMember(
        name: _data["player1"]["name"],
        country: _data["player1"]["country"],
      );
      TeamMember player2 = TeamMember(
        name: _data["player2"]["name"],
        country: _data["player2"]["country"],
      );
      TeamMember player3 = TeamMember(
        name: _data["player3"]["name"],
        country: _data["player3"]["country"],
      );

      TeamMember? sub;
      TeamMember? coach;

      if (_data["sub"] != null) {
        sub = TeamMember(
          name: _data["sub"]["name"],
          country: _data["sub"]["country"],
        );
      }
      if (_data["coach"] != null) {
        coach = TeamMember(
          name: _data["coach"]["name"],
          country: _data["coach"]["country"],
        );
      }

      return Team(
        name: _data["name"],
        abbrev: _data["abbrev"],
        player1: player1,
        player2: player2,
        player3: player3,
        sub: sub,
        coach: coach,
      );
    }

    Future<List<Object?>> getCurrentFavourites(_userRef, String uid) async {
      DatabaseEvent _readCurrentFavourites = await _userRef.child(uid).once();
      if (_readCurrentFavourites.snapshot.value != null) {
        late List<Object?> _data =
            _readCurrentFavourites.snapshot.value as List<Object?>;
        return _data;
      }
      return [];
    }

    isInFavourites() async {
      String _uid = FirebaseAuth.instance.currentUser!.uid;

      DatabaseReference _userRef = FirebaseDatabase.instance.ref('users/');
      List<Object?> _currentFavourites =
          new List<Object?>.from(await getCurrentFavourites(_userRef, _uid));

      for (dynamic _team in _currentFavourites) {
        if (args.team!["abbrev"] == _team?["abbrev"]) return true;
        if (createTeam(args.team!) == createTeam(_team)) return true;
      }
      return false;
    }

    addToFavourites() async {
      String _uid = FirebaseAuth.instance.currentUser!.uid;
      DatabaseReference _userRef = FirebaseDatabase.instance.ref('users/');

      List<Object?> _currentFavourites =
          new List<Object?>.from(await getCurrentFavourites(_userRef, _uid));
      _currentFavourites.add({
        "abbrev": args.team!["abbrev"],
        "coach": args.team!["coach"],
        "name": args.team!["name"],
        "player1": args.team!["player1"],
        "player2": args.team!["player2"],
        "player3": args.team!["player3"],
        "region": args.team!["region"],
        "sub": args.team!["sub"],
      });

      bool alreadyAdded = await isInFavourites();

      if (alreadyAdded == false) {
        await _userRef.child(_uid).set(_currentFavourites);

        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('${args.team!["name"]} added to favourites!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ));
      } else {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('${args.team!["name"]} already in favourites!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ));
      }
    }

    Team _team = createTeam(args.team!);
    List<TeamMember> _players = [_team.player1, _team.player2, _team.player3];

    return NestedScreen(
      title: _team.name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TeamLogo(
            name: _team.name,
            abbrev: _team.abbrev,
          ),
          Roster(
            players: _players,
            sub: _team.sub,
            coach: _team.coach,
          ),
          ElevatedButton(
              onPressed: addToFavourites, child: Text("Add to Favourites")),
        ],
      ),
      args: args,
    );
  }
}
