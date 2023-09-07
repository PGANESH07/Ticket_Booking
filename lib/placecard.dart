import 'package:flutter/material.dart';
import 'package:tbs/booking.dart';

class placeCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagepath;
  placeCard(
      {required this.title,
      required this.description,
      required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        imagepath,
                        width: 40,
                        height: 40,
                      ),
                      Column(children: [
                        Text(title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 8),
                        Text(description, style: TextStyle(fontSize: 16))
                      ]),
                      TextButton(
                        onPressed: () {
                          print("going to book");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => book(place:title)));
                        },
                        child: Text("Book Now"),
                      )
                    ])
              ],
            )));
  }
}
