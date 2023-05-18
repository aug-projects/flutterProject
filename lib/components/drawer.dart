import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/constants.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      const UserAccountsDrawerHeader(
        accountName: Text("Haytham", style: titleTextStyle),
        accountEmail: Text("hsalamaasalama@gmail.com"),
        decoration: BoxDecoration(color: primaryColor),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.pink,
          child: Text("H", style: titleTextStyle),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.edit, color: secondaryColor),
        onTap: () => Navigator.of(context).pushNamed("/create-quiz"),
        title: const Text("Create Quiz", style: titleTextStyle),
      ),
      ListTile(
        onTap: () => Navigator.of(context).pushNamed("/start-quiz"),
        leading: const Icon(Icons.quiz, color: secondaryColor),
        title: const Text("Start Quiz", style: titleTextStyle),
      ),
      const Divider(color: borderColor),
      ListTile(
        onTap: () {
          SystemNavigator.pop();
        },
        leading: const Icon(Icons.exit_to_app, color: secondaryColor),
        title: const Text("Exit", style: titleTextStyle),
      ),
    ]));
  }
}
