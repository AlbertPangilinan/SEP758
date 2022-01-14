import 'package:flutter/material.dart';
import 'widgets/NavBar.dart';
import 'widgets/TopBar.dart';
import '../classes/ScreenArguments.dart';

class NestedScreen extends StatefulWidget {
  const NestedScreen({
    Key? key,
    required this.title,
    required this.child,
    required this.args,
  }) : super(key: key);

  final String title;
  final Widget child;
  final ScreenArguments args;

  @override
  _NestedScreenState createState() => _NestedScreenState();
}

class _NestedScreenState extends State<NestedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: widget.title,
        args: widget.args,
        automaticallyImplyLeading: true,
      ),
      body: widget.child,
      bottomNavigationBar: NavBar(
        title: widget.title,
        args: widget.args,
      ),
    );
  }
}
