// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

// ignore: camel_case_types
class placeCard extends StatelessWidget {
  final String title1;
  final String description;
  final String imagepath;

   // ignore: use_key_in_widget_constructors
   placeCard({
    required this.title1,
    required this.description,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: [
                Image.asset(imagepath),
              ],
            )),
            Expanded(
                child: Card(
                    color: Colors.blue[50],
                    margin: const EdgeInsets.all(5.0),
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          description,
                          softWrap: true,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        )))),
          ],
        ),
      ),
    );
  }
}
