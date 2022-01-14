import 'package:flutter/material.dart';
import '../../../classes/ScreenArguments.dart';
import '../../../constants/colors.dart';

class FavouriteTeamEntry extends StatelessWidget {
  const FavouriteTeamEntry({
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
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              team["region"],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
          title: Text(
            team["name"],
            style: TextStyle(fontSize: 18),
          ),
          // trailing: SizedBox(
          //     width: 128,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: [
          //         Image.asset(
          //           'images/teams/${team["abbrev"]}.png',
          //           width: 64,
          //         ),
          //         IconButton(
          //             icon: Icon(Icons.delete_outline),
          //             color: Color.fromRGBO(2, 2, 2, 1),
          //             onPressed: () {})
          //       ],
          //     )),
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
