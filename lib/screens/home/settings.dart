import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isdark = false;
  void signout() async {
    FirebaseAuth.instance.signOut();
    final googlesignin = GoogleSignIn();
    await googlesignin.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    print(size.height);
    print(size.width);
    return Scaffold(
        appBar: AppBar(title: Text("Settings"), centerTitle: true),
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(top: size.height / 30),
            height: size.height / 3,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: user != null ? Colors.grey : null,
                  backgroundImage: NetworkImage(user!.photoURL.toString()),
                  radius: 50,
                ),
                SizedBox(height: size.height / 30),
                Container(
                  height: size.height / 30,
                  width: size.width / 2,
                  child: FittedBox(
                      child: Text(
                    user.displayName.toString(),
                  )),
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Dark Mode"),
            leading: FaIcon(FontAwesomeIcons.lightbulb),
            trailing: Switch(
                value: isdark,
                onChanged: (_) {
                  setState(() {
                    isdark = !isdark;
                  });
                }),
          ),
          Divider(),
          ListTile(
            title: Text("Help"),
            leading: FaIcon(FontAwesomeIcons.question),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Legal & Policies"),
            leading: FaIcon(FontAwesomeIcons.handPaper),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("LogOut"),
            leading: FaIcon(FontAwesomeIcons.signOutAlt),
            onTap: () {
              // ignore: unnecessary_statements

              Navigator.of(context).pushReplacementNamed('/');

              signout();
            },
          ),
          Divider(),
        ]));
  }
}
