// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:tbs/booking/qrimage.dart';
import 'package:tbs/booking/sidemenu.dart';
import 'package:tbs/booking/states.dart';
import 'package:tbs/responsive.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TBS PROJECT"),
        
      ),
      drawer: SideMenu(),
      body: const Responsive(
          mobile: Column(children: [Expanded(flex: 1, child: States())]),
          tablet: Row(
            children: [Expanded(flex: 3, child: States())],
          ),
          desktop: Row(
            children: [Expanded(flex: 5, child: States())],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          if (user == null) {
            _showSignIn(context);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>const QrTicket()));
          }
        },
        child: const Center(child: Text(" Ticket ")),
      ),
    ));
  }

  void _showSignIn(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Attention: '),
          content: const Text('please sign in to continue'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the alert dialog
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
