import 'package:flutter/material.dart';
import 'widgets/NavBar.dart';
import 'widgets/TopBar.dart';
import '../classes/ScreenArguments.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.title,
    required this.child,
    required this.args,
  }) : super(key: key);

  final String title;
  final Widget child;
  final ScreenArguments args;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: TopBar(
            title: widget.title,
            args: widget.args,
            automaticallyImplyLeading: false,
          ),
          body: widget.child,
          bottomNavigationBar: NavBar(
            title: widget.title,
            args: widget.args,
          ),
        ));
  }
}
