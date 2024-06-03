// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

// ignore: camel_case_types, must_be_immutable
class ticketCard extends StatelessWidget {
   var  ticketno;
  var validtill;
  // ignore: non_constant_identifier_names
  var DOB;
  var noofticket;
  var ticketid;
 var place;
  var imageUrl;
  ticketCard(
      {
      // ignore: non_constant_identifier_names
      this.DOB,
      this.validtill,
      this.imageUrl,
      this.place,
      this.ticketno,
      this.noofticket,
      this.ticketid});

  @override
  Widget build(BuildContext context) {
    //final Size screensize = MediaQuery.of(context).size;
    return Card(
        child: Column(children: [
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: Center(
            child: Text(
          "$ticketno",
          style: const TextStyle(fontSize: 24, color: Colors.white),
        )),
      ),
      Card(
          margin: const EdgeInsets.all(10),
          color: Colors.white,
          child: Column(children: [
            ImageNetwork(
              image: imageUrl,
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 5),
            Text(
              "valid till:  $validtill",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue),
            )
          ])),
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Ticket Id :        ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text("$ticketid")
        ]),
      ),
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Place :                    ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text("$place")
        ]),
      ),
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'No of Visitors :                       ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text("$noofticket")
        ]),
      ),
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Booking Date :        ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text("$DOB")
        ]),
      ),
      
    ]));
  }
}
