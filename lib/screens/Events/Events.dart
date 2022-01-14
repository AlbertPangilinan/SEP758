import 'package:flutter/material.dart';
import '../MainScreen.dart';
import 'widgets/WorldMap/WorldMap.dart';
import '../../classes/ScreenArguments.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return MainScreen(
      title: 'Events',
      child: WorldMap(),
      args: args,
    );
  }
}
