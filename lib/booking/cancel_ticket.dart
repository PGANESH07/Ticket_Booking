// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class cancelpage extends StatefulWidget {
  final String userId;
  const cancelpage({super.key, required this.userId});

  @override
  State<cancelpage> createState() => _cancelpageState();
}

class _cancelpageState extends State<cancelpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: StreamBuilder<List<QueryDocumentSnapshot>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userId)
            .collection('cancelled_tickets')
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
            return ListView.builder(
              shrinkWrap: true,
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final document = documents[index];
                final textData = document['pov'];
                final Timestamp dateofvisit = document['dov'];
                final DateTime dov = dateofvisit.toDate();
                final date = "${dov.day} ${dov.month} ${dov.year}";
                return Card(
                  child: Column(
                    children: [
                      Text("Ticket $index"),
                      Text(textData),
                      Text(date),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
