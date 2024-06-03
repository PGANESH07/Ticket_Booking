import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tbs/booking/ticket.dart';

class Book extends StatefulWidget {
  final String place;
  final firestore = FirebaseFirestore.instance;

  // User's unique ID assigned by Firebase Authentication
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Book({super.key, required this.place});
  @override

  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<Book> {
  List<String> adultNames = [''];
  List<String> childNames = [''];
  ScreenshotController screencon = ScreenshotController();
  int numberOfTickets = 0;
  double totalAmount = 0.0;
  DateTime selectedDate = DateTime.now();
  String selectedNationality = 'Indian';
  String selectedIdProof = 'Aadhar';
  String customIdProof = '';
  String selectedTimeOfDay = 'Morning';
  String selectedPaymentMethod = 'PhonePe'; 

  String paymentStatus = 'Not Paid';
  String ticketId = "";
  String imagedata = "";
  bool showProgress = false;
  Color buttonColor = Colors.blue;
  Color getButtonColor(double billAmount) {
    //print("changing button color");
    if (billAmount == 0) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  Future<String> storeTicket(
      String names,
      String pov,
      String idproof,
      double amount,
      DateTime dov,
      DateTime dob,
      String session,
      bool cancelled,
      bool redeemed,
      bool expired,
      String imagerurl,
      String nation,
      int noofticket) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('tickets')
        .get();

    DocumentReference<Map<String, dynamic>> docid = await widget.firestore
        .collection('users')
        .doc(widget.userId)
        .collection('tickets')
        .add({
      'ticket_id': '${snapshot.size + 1}',
      'names': names,
      'pov': pov,
      'nationality': nation,
      'idproof': idproof,
      'amount': amount,
      'dov': dov,
      'dob': dob,
      'session': session,
      'cancelled': cancelled,
      'redeemed': redeemed,
      'imageurl': imagerurl,
      'nooftickets': noofticket,
    });

    return docid.id;
  }

  void updateNumberOfTickets() {
    int adultCount = adultNames.where((name) => name.isNotEmpty).length;
   
    setState(() {
      numberOfTickets = adultCount ;
      updateTotalAmount();
    });
  }

  void updateTotalAmount() {
    totalAmount = selectedNationality == 'Indian'
        ? numberOfTickets * 10.0
        : numberOfTickets * 250.0;

    buttonColor = getButtonColor(totalAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ticket Booking Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Visiting Place : ${widget.place}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Date: ${selectedDate.toLocal().toString().split(' ')[0]}',
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      ).then((date) {
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      });
                    }, 
                    child: const Text('Select Date'),
                  ),
                  Column(
                    children: [
                      for (int i = 0; i < adultNames.length; i++)
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  adultNames[i] = value;
                                  updateNumberOfTickets();
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Adult Name'),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  adultNames.removeAt(i);
                                  updateNumberOfTickets();
                                });
                              },
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                adultNames.add('');
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      for (int i = 0; i < childNames.length; i++)
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  childNames[i] = value;
                                  updateNumberOfTickets();
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Child Name : (Age below 8)'),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  childNames.removeAt(i);
                                  updateNumberOfTickets();
                                });
                              },
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                childNames.add('');
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Number of Tickets: $numberOfTickets'),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedNationality,
                    onChanged: (String? value) {
                      setState(() {
                        selectedNationality = value ?? 'Indian';
                        updateTotalAmount();
                      });
                    },
                    items: ['Indian', 'Foreigner'].map((String nationality) {
                      return DropdownMenuItem<String>(
                        value: nationality,
                        child: Text(nationality),
                      );
                    }).toList(),
                    decoration: const InputDecoration(labelText: 'Nationality'),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedIdProof,
                    onChanged: (String? value) {
                      setState(() {
                        selectedIdProof = value ?? 'Aadhar';
                      });
                    },
                    items:
                        ['Aadhar', 'Passport', 'Others'].map((String idProof) {
                      return DropdownMenuItem<String>(
                        value: idProof,
                        child: Text(idProof),
                      );
                    }).toList(),
                    decoration: const InputDecoration(labelText: 'ID Proof'),
                  ),
                  if (selectedIdProof == 'Others')
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          customIdProof = value;
                        });
                      },
                      decoration:
                          const InputDecoration(labelText: 'Custom ID Proof'),
                    ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedTimeOfDay,
                    onChanged: (String? value) {
                      setState(() {
                        selectedTimeOfDay = value ?? 'Morning';
                      });
                    },
                    items: ['Morning', 'Afternoon'].map((String time) {
                      return DropdownMenuItem<String>(
                        value: time,
                        child: Text(time),
                      );
                    }).toList(),
                    decoration: const InputDecoration(labelText: 'Time of Day'),
                  ),
                  const SizedBox(height: 10),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {
                      if (totalAmount == 0) {
                        showDialog(
                            context: (context),
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Amount error:'),
                                content: const Text(
                                    "bill amount is zero. Please book ticket."),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("ok"))
                                ],
                              );
                            });
                      } else {
                        showSummary();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    child: const Text('Make Payment'),
                  )),
                  const SizedBox(height: 16),
                ]),
          ),
        ));
  }

  void showPayment() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showProgress)
                const CircularProgressIndicator(
                  color: Colors.red,
                ),
              Text('Payment Status: $paymentStatus'),
              Text('Amount to Pay: \$${totalAmount.toStringAsFixed(2)}'),
              DropdownButtonFormField<String>(
                value: selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    selectedPaymentMethod = value ?? 'PhonePe';
                  });
                },
                items:
                    ['PhonePe', 'Google Pay', 'Paytm'].map((String paymentApp) {
                  return DropdownMenuItem<String>(
                    value: paymentApp,
                    //child: Text(paymentApp),
                    child: Row(
                      children: [
                        if (paymentApp == 'PhonePe')
                          const Icon(Icons.phone_android), // PhonePe icon
                        if (paymentApp == 'Google Pay')
                          const Icon(Icons.monetization_on), // Google Pay icon
                        if (paymentApp == 'Paytm')
                          const Icon(
                              Icons.account_balance_wallet), // Paytm icon
                        const SizedBox(width: 10),
                        Text(paymentApp),
                      ],
                    ),
                  );
                }).toList(),
                decoration:
                    const InputDecoration(labelText: 'Select Payment App'),
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    showProgress = true;
                  });
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              if (showProgress)
                                const CircularProgressIndicator(),
                              const SizedBox(height: 16),
                              const Text('Completing Payment...'),
                            ],
                          ),
                        ),
                      );
                    },
                  );

                  String namestodb = "";
                  namestodb += adultNames.join(",");
                  namestodb += childNames.join(",");

                  ticketId = await storeTicket(
                      namestodb,
                      widget.place,
                      selectedIdProof,
                      totalAmount,
                      selectedDate,
                      DateTime.now(),
                      selectedTimeOfDay,
                      false,
                      false,
                      false,
                      "empty",
                      selectedNationality,
                      numberOfTickets);
                  imagedata = "user:${widget.userId}:ticket:$ticketId";

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketQr(
                                imagedata: imagedata,
                                ticketno: ticketId,
                                userid: widget.userId!,
                              )));
                },
                child: const Text('Pay Now'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void showSummary() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Booking Details', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Date:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("${selectedDate.toLocal().toString().split(' ')[0]}")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Adult Names:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("${adultNames.join(", ")}",)
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Child Names:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("${childNames.join(", ")}")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Number of Tickets:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("$numberOfTickets")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Nationality:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("$selectedNationality")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('ID Proof:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("$selectedIdProof")
              ]),
              if (selectedIdProof == 'Others')
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Custom ID Proof:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("$customIdProof")
                    ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Time of Day:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("$selectedTimeOfDay")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Total Amount: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("₹${totalAmount.toStringAsFixed(2)}")
              ]),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                showPayment();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  Widget buildTicketDetail(String heading, String details) {
    final isBold = [
      'Date',
      'Adult Names',
      'Child Names',
      'Number of Tickets',
      'Nationality',
      'ID Proof',
      'Time of Day',
      'Total Amount',
      'Payment Status',
    ].contains(heading);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$heading: ',
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
            ),
            TextSpan(
              text: details,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
