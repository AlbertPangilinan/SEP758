import 'package:finalproject/classes/ScreenArguments.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar(
      {Key? key,
      required this.title,
      required this.args,
      required this.automaticallyImplyLeading})
      : super(key: key);

  final String title;
  final ScreenArguments args;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    List<Widget> _actions = [
      IconButton(
          icon: Icon(Icons.settings_outlined),
          onPressed: () {
            Navigator.pushNamed(context, '/settings', arguments: args);
          })
    ];

    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      ),
      actions: _actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
