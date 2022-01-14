import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/colors.dart';

class ThemeSelect extends StatefulWidget {
  const ThemeSelect({Key? key}) : super(key: key);

  @override
  State<ThemeSelect> createState() => _ThemeSelectState();
}

class _ThemeSelectState extends State<ThemeSelect> {
  String _currentTheme = "Blue - Light";

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentTheme = prefs.getString('theme') ?? "Blue - Light";
    });
  }

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    void setTheme(String theme) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("theme", theme);

      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(
                    'Theme changed! Please fully restart app to see changes.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Current Theme: $_currentTheme",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Light Themes:",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: ElevatedButton(
                onPressed: () => setTheme("Blue - Light"),
                child: Text("Blue - Light"),
                style: ElevatedButton.styleFrom(primary: blue),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              child: ElevatedButton(
                onPressed: () => setTheme("Orange - Light"),
                child: Text("Orange - Light"),
                style: ElevatedButton.styleFrom(primary: orange),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Dark Themes:",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: ElevatedButton(
                onPressed: () => setTheme("Blue - Dark"),
                child: Text("Blue - Dark"),
                style: ElevatedButton.styleFrom(primary: blue),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              child: ElevatedButton(
                onPressed: () => setTheme("Orange - Dark"),
                child: Text("Orange - Dark"),
                style: ElevatedButton.styleFrom(primary: orange),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
