import 'package:finalproject/screens/UserSettings/widgets/ThemeSelect.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'widgets/UserInfo.dart';
import '../../classes/ScreenArguments.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({
    Key? key,
  }) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  bool _isSigningOut = false;

  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    signOutHandler() async {
      setState(() {
        _isSigningOut = true;
      });
      await FirebaseAuth.instance.signOut();
      setState(() {
        _isSigningOut = false;
      });

      Navigator.pushNamed(context, '/login');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            UserCredentials(
              username: args.user!.displayName ?? '',
              email: args.user!.email ?? '',
            ),
            ThemeSelect(),
            _isSigningOut
                ? CircularProgressIndicator()
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 32),
                    child: ElevatedButton(
                      onPressed: signOutHandler,
                      child: Text('Sign out'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
