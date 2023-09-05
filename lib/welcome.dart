import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final isemailverified = true;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String name = "User";
    if (user?.displayName != null) {
      name = (user?.displayName)!;
    }
    if (isemailverified == true) {
      return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
                child: IconButton(
              icon: Icon(Icons.account_circle_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<ProfileScreen>(
                        builder: (context) => ProfileScreen(
                              appBar: AppBar(
                                title: Text("user Profile"),
                              ),
                              actions: [
                                SignedOutAction((context) {
                                  Navigator.of(context).pop();
                                })
                              ],
                            )));
              },
            )),
            body: Center(
              child: Text("welcome " + name),
            )),
      );
    }

    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Text("hello noting is fine"),
      )),
    );
  }
}
