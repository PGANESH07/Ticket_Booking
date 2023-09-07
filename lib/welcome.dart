import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:tbs/placecard.dart';

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
              appBar: AppBar(
                title: Text("TBS PROJECT"),
              ),
              drawer: Drawer(
                  
                  semanticLabel: "TBS",
                  child: Column(
                    children: <Widget>[
                      ListTile(title: Text("About"),),
                      ListTile(
                        leading: Text("Account Details"),
                        trailing: IconButton(
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
                        ),
                      ),
                      AboutDialog(
                        applicationName: "TBS",
                        applicationVersion: "1.0.0",
                      )
                    ],
                  )),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    placeCard(
                      title: "Charminar",
                      description: "Oldest minar",
                      imagepath: "assets/images/char.png",
                    ),
                    placeCard(
                      title: "Golconda",
                      description: "nawab house",
                      imagepath: "assets/images/char.png",
                    )
                  ])));
    }

    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Text("hello nothing is fine"),
      )),
    );
  }
}
