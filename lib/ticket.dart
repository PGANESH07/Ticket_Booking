import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticketqr extends StatelessWidget {
  final String data;
  Ticketqr({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("QR ticket")),
        body: Center(
            child: Card(
          child: //Image.asset("assets/images/char.png",width: 200,height: 200,),
              QrImageView(
            data: data,
          ),
          margin: EdgeInsets.all(100),
        )));
  }
}
