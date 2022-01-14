import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'widgets/RegionListEntry.dart';
import '../MainScreen.dart';
import '../../classes/ScreenArguments.dart';

class RegionList extends StatelessWidget {
  const RegionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    Future<List<RegionListEntry>> getRegions() async {
      DatabaseReference _regionsRef = FirebaseDatabase.instance.ref("regions");
      DatabaseEvent _readRegions = await _regionsRef.once();

      late List<Object?> _data = _readRegions.snapshot.value as List<Object?>;
      List<RegionListEntry> regions = [];

      for (dynamic _obj in _data) {
        regions.add(RegionListEntry(
          name: _obj["name"],
          abbrev: _obj["abbrev"],
          teams: _obj['teams'],
        ));
      }
      return regions;
    }

    return FutureBuilder(
      future: getRegions(),
      builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
        List<Widget> children;

        if (snapshot.hasData) {
          children = snapshot.data!;
        } else {
          children = [Text('Teams')];
        }

        return MainScreen(
          title: 'Regions',
          child: ListView.builder(
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index) {
              return children[index];
            },
          ),
          args: args,
        );
      },
    );
  }
}
