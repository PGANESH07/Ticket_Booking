import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:tbs/booking/welcome.dart';
import 'package:tbs/login_pages/auth_gate.dart';

class SideMenu extends StatelessWidget {
  SideMenu({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
        semanticLabel: "TBS",
        child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                const Text("About"),
                ListTile(
                  leading: const Text("Account Details"),
                  trailing: IconButton(
                      icon: const Icon(Icons.account_circle_rounded,color: Colors.blue,),
                      onPressed: () {
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute<ProfileScreen>(
                                  builder: (context) => ProfileScreen(
                                        appBar: AppBar(
                                          title: const Text("user Profile"),
                                        ),
                                        actions: [
                                          SignedOutAction((context) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          })
                                        ],
                                      )));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AuthGate()));
                        }
                      }),
                ),
                Card(shadowColor: Colors.blue,
                    child: AboutDialog(
                  applicationName: "Ticket Booking System",
                  applicationVersion: "1.0.0",
                  children: [Image.asset('assets/images/app_icon.jpeg')],
                )),
              ],
            )));
  }
}
