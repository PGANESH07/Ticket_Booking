import 'package:flutter/material.dart';
import 'package:tbs/ticket.dart';

class book extends StatefulWidget {
  final String place;
  const book({super.key, required this.place});

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> {
  String datatosend = "Thank you,for Booking \n ";
  DateTime bookingdate = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Book your ticket")),
        body: Column(
          children: <Widget>[
            TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                )),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Age"),
            ),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2024),
              onDateChanged: (DateTime value) {
                bookingdate = value;
                print(bookingdate.toString());
              },
            ),
            IconButton(
              onPressed: () {
                if (nameController.text.isEmpty | ageController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text("please fill your details correctly"),
                          ));
                } else {
                  datatosend += "Name " + nameController.text.toString() + "\n";
                  datatosend += "Age " + ageController.text.toString() + "\n";
                  datatosend += "Date to Visit " +
                      bookingdate.day.toString() +
                      " " +
                      bookingdate.toString() +
                      "\n";
                  datatosend += "enjoy your visit to" + widget.place;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ticketqr(data: datatosend),
                      ));
                }
              },
              icon: Icon(Icons.attach_money_sharp),
              color: Colors.amber,
            )
          ],
        ));
  }
}

void ok() {}
