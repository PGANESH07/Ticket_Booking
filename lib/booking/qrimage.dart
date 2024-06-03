import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tbs/booking/cancel_ticket.dart';
import 'package:tbs/booking/ticket_image.dart';
import 'package:tbs/booking/welcome.dart';

class QrTicket extends StatefulWidget {
  const QrTicket({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QrTicket> {
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> cancelTicket(String documentId, String imageUrl) async {
    try {
      DocumentSnapshot ticketDocument = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tickets')
          .doc(documentId)
          .get();

      if (ticketDocument.exists) {
        // Move the entire document to the "cancelled_tickets" collection
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('cancelled_tickets')
            .doc(documentId)
            .set(ticketDocument.data() as Map<String, dynamic>);

        // Delete the document from the "tickets" collection
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('tickets')
            .doc(documentId)
            .delete();

        //print(
        //   'Document moved to "cancelled_tickets" collection and deleted from "tickets" collection');
      } else {
        //print('Document not found in "tickets" collection');
      }
      // Extract the path of the file from the URL
      //final Uri uri = Uri.parse(imageUrl);
      //final String path = uri.path;
      // Delete the file from Firebase Cloud Storage
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();
      //print('Image deleted from Cloud Storage');
    } catch (e) {
      // print('Error deleting document from Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the desired image size based on the screen size
   // double imgwidth = screenHeight * 0.5;
   // double imgheight = screenHeight * 0.5;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tickets'),
        leading: BackButton(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }),
        actions: <Widget>[
          TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cancelpage(userId: userId!)));
              },
              child: const Text(
                "cancelled ticket",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: StreamBuilder<List<QueryDocumentSnapshot>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('tickets')
            .orderBy('dob', descending: true)
            .snapshots()
            .map((event) => event.docs),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Loading indicator while fetching data
          } else {
            final documents = snapshot.data;
            if (documents!.isEmpty) {
              return const Center(
                child: Text("No tickets"),
              );
            }
            return Center(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final document = documents[index];
                final docid = document.id;
                final imageUrl = document['imageurl'];
                final Timestamp dobook = document['dob'];
                final DateTime dob = dobook.toDate();
                final dateofbook = "${dob.day} ${dob.month} ${dob.year}";
                final placeData = document['pov'];
                final Timestamp dateofvi = document['dov'];
                final DateTime dov = dateofvi.toDate();
                final dateofvisit = "${dov.day} ${dov.month} ${dov.year}";
                final nooftickets = document['nooftickets'];
                return Card(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  ticketCard(
                    ticketno: index,
                    ticketid: docid,
                    DOB: dateofbook,
                    imageUrl: imageUrl,
                    place: placeData,
                    validtill: dateofvisit,
                    noofticket: nooftickets,
                  ),
                  TextButton(
                    onPressed: () {
                      cancellationAlert(context, docid, imageUrl);
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ])));
              },
            ));
          }
        },
      ),
    );
  }

  void cancellationAlert(BuildContext context, String docid, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('attention: '),
          content: const Text(
              'Your ticket will cancelled.\n Do you want to continue?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () async {
                await cancelTicket(docid, imageUrl);
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                // Close the alert dialog
              },
              child:const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
