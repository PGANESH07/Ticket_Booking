import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:tbs/booking/welcome.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  final bool isemailverified = true;
  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];
    FirebaseAuth? fire = FirebaseAuth.instance;

    return MaterialApp(
        initialRoute: fire.currentUser == null ? '/sign-in' : '/profile',
        routes: {
          '/profile': (context) {
            return ProfileScreen(
              cupertinoNavigationBar: const CupertinoNavigationBar(),
              avatar: UserAvatar(auth: fire),
              providers: providers,
              actions: [
                SignedOutAction((context) {
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
              ],
            );
          },
          '/sign-in': (context) {
            return SignInScreen(
              resizeToAvoidBottomInset: true,
              showAuthActionSwitch: false,
              providers: providers,
              headerBuilder: (context, constraints, shrinkOffset) {
                return Image.asset("assets/images/app_icon.jpeg");
              },
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
              ],
              subtitleBuilder: (context, action) {
                return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        'Welcome to Ticket-Book-Heritage-INDIA , please sign in!'));
              },
              sideBuilder: ((context, constraints) {
                return Image.asset("assets/images/app_icon.jpeg");
              }),
              footerBuilder: (context, action) {
                return SingleChildScrollView(
                    child: Column(children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: const Text("Register")),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      icon: const Icon(Icons.arrow_back_sharp))
                ]));
              },
            );
          },
          '/register': (context) {
            return RegisterScreen(
              headerBuilder: (context, constraints, shrinkOffset) {
                return Image.asset("assets/images/app_icon.jpeg");
              },
              actions: [
                AuthStateChangeAction<UserCreated>((context, state) {
                  // print("registerd ");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
              ],
              subtitleBuilder: (context, action) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                      'Welcome to Ticket-Book-Heritage-INDIA, please sign up!'),
                );
              },
              sideBuilder: ((context, constraints) {
                return Image.asset("assets/images/app_icon.jpeg");
              }),
              footerBuilder: (context, action) {
                return IconButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    icon: const Icon(Icons.arrow_back_sharp));
              },
            );
          }
        });
  }
}
