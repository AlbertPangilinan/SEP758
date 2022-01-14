import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/Home/Home.dart';
import 'screens/Events/Events.dart';
import 'screens/Login/Login.dart';
import 'screens/Register/Register.dart';
import 'screens/TeamList/TeamList.dart';
import 'screens/TeamInfo/TeamInfo.dart';
import 'screens/RegionList/RegionList.dart';
import 'screens/UserSettings/UserSettings.dart';
import 'constants/themes.dart';

void main() async {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _currentThemeStr = "Blue - Light";
  ThemeData? _currentTheme;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentThemeStr = prefs.getString('theme') ?? "Blue - Light";
      _currentTheme = themes[_currentThemeStr];
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/home': (context) => Home(),
        '/events': (context) => Events(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/regionlist': (context) => RegionList(),
        '/teamlist': (context) => TeamList(),
        '/team': (context) => TeamInfo(),
        '/settings': (context) => UserSettings(),
      },
      theme: _currentTheme,
    );
  }
}
