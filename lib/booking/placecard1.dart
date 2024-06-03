import 'package:flutter/material.dart';
import 'package:tbs/booking/booking.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PlaceCard extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final String title1;
  final String description;
  final String imagepath;
  final String place;

  PlaceCard({
    super.key,
    required this.title1,
    required this.description,
    required this.imagepath,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Colors.blue[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      imagepath,
                      width: screensize.width * 0.4,
                      height: screensize.width * 0.4,
                    )),
              ],
            )),
            Expanded(
              child: Column(children: <Widget>[
                Text(
                  title1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                ),
                Card(
                    color: Colors.blue[50],
                    margin: const EdgeInsets.all(1.0),
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          description,
                          softWrap: true,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ))),
                const SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () {
                      if (user == null) {
                        _showSignIn(context);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Book(place: place)));
                      }
                    },
                    child: const Text('Book Now'))
              ]),
            ),
          ],
        ),
      ),
    );
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
