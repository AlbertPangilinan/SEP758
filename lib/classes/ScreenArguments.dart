import 'package:firebase_auth/firebase_auth.dart';
import 'Team.dart';

class ScreenArguments {
  User? user;
  String? region;
  List<Object?>? teams;
  Map? team;

  ScreenArguments({
    this.user,
    this.region,
    this.teams,
    this.team,
  });
}
