// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tbs/booking/qrimage.dart';
import 'package:tbs/booking/welcome.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TicketQr extends StatefulWidget {
  final String imagedata;
  final String ticketno;
  final String userid;
  const TicketQr(
      {super.key,
      required this.imagedata,
      required this.ticketno,
      required this.userid});

  @override
  State<TicketQr> createState() => _TicketQrState();
}

class _TicketQrState extends State<TicketQr> {
  @override
  void initState() {
    super.initState();
   
    captureScreenshot();
  }

  bool isUploading = false;
  ScreenshotController screen = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("QR ticket"),
          leading: BackButton(onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          })),
      body: Center(
        child: Column(children: [
          Screenshot(
              controller: screen,
              child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    QrImageView(
                        backgroundColor: Colors.white,
                        data: widget.imagedata,
                        version: 4,
                        size: 300)
                  ]))),
          isUploading
              ? const CircularProgressIndicator(
                  color: Colors.red,
                )
              : ElevatedButton(
                  onPressed: () {
                    //print(widget.imagedata);
                    setState(() {
                      isUploading = true;
                    });
                  },
                  child: const Text(" upload Ticket to cloud"))
        ]),
      ),
    );
  }

  Future<void> captureScreenshot() async {
    setState(() {
      isUploading = true;
    });
    screen
        .capture(delay: const Duration(milliseconds: 50))
        .then((ticketimage) async {
      //await _saveImageToGallery(ticketimage!);

      final imagefile = ticketimage!;
      String imagename = "${widget.ticketno}.png";

      await uploadQRCodeImage(imagefile, imagename);
      taketoticket(context);
    });
    // Save or process the captured screenshot as needed
    // You can upload it to Firebase Storage, save it to the device
  }

  Future<void> uploadQRCodeImage(Uint8List pngData, String imageName) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child(imageName);
      UploadTask uploadTask = storageReference.putData(pngData);

      // Wait for the upload to complete and get the download URL
      await uploadTask;
      String downloadURL = await storageReference.getDownloadURL();
      await updateDocumentField(downloadURL);
    } catch (e) {
      //print(e.toString());
    } finally {
      setState(() {
        isUploading = false;
      });
    }
  }

  Future<void> updateDocumentField(String imagelink) async {
    final documentRef = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userid)
        .collection('tickets')
        .doc(widget.ticketno);

    try {
      await documentRef.update({
        'imageurl': imagelink,
      });
      //print('Document field updated successfully.');
    } catch (e) {
      //print('Error updating document field: $e');
    }
  }

  void taketoticket(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank you'),
          content: const Text('your Ticket has been uploaded to cloud.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the alert dialog
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const QrTicket()));
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
