import 'package:flutter/material.dart';

class city extends StatefulWidget {
  const city({super.key});

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  State<city> createState() => _cityState();
}

class _cityState extends State<city> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: (Text("STATES")),
        ),
        body: Column(
          children: [
            Card(
              child: Text("Hyderabad"),
            )
          ],
        ),
      ),
    );
  }
}
