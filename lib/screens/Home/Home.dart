import 'package:finalproject/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../MainScreen.dart';
import 'widgets/FavouriteTeamEntry.dart';
import '../../classes/ScreenArguments.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    User? _user = FirebaseAuth.instance.currentUser;

    Future<List<Object?>> getFavourites() async {
      String _uid = _user!.uid;
      DatabaseReference _userRef = FirebaseDatabase.instance.ref('users/');

      DatabaseEvent _readCurrentFavourites = await _userRef.child(_uid).once();
      if (_readCurrentFavourites.snapshot.value != null) {
        late List<Object?> _data =
            _readCurrentFavourites.snapshot.value as List<Object?>;
        return _data;
      }
      return [];
    }

    return MainScreen(
      title: 'Welcome, ${_user!.displayName}!',
      child: Column(
        children: [
          Container(
            color: darkgrey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Image.asset('images/rlesports.png'),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 32),
              child: Text(
                "Favourite Teams",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              )),
          FutureBuilder(
            future: getFavourites(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Object?>> snapshot) {
              List<Object?> favourites;

              if (snapshot.hasData) {
                favourites = snapshot.data!;
              } else {
                favourites = [];
              }

              return Expanded(
                child: Scrollbar(
                  isAlwaysShown: true,
                  child: ListView.builder(
                    itemCount: favourites.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Map team = favourites[index] as Map;
                      return FavouriteTeamEntry(team: team);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      args: args,
    );
  }
}
