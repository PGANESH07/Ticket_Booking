import 'package:flutter/material.dart';
import 'package:tbs/booking/placecard1.dart';

class Telangana extends StatelessWidget {
  const Telangana({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Telangana',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          PlaceCard(
              title1: 'Charminar',
              description:
                  'The Charminar is a monument located in Hyderabad.It is also known for its popular and busy local markets surrounding the structure.',
              imagepath: 'assets/images/telangana/hyd.jpg',
              place: 'Charminar'),
          PlaceCard(
              title1: 'SalarJung Museum',
              description:
                  'The Salar Jung Museum was established in the year 1951 and is located on the southern bank of the River Musi in Hyderabad.',
              imagepath: 'assets/images/telangana/salar.jpg',
              place: 'SalarJung Museum'),
          PlaceCard(
              title1: 'Ramappa Temple',
              description:
                  'Rudreshwara, popularly known as Ramappa Temple, is located in the village of Palampet approximately 200km north-east of Hyderabad.',
              imagepath: 'assets/images/telangana/warangal_temple.png',
              place: 'Ramappa Temple'),
          PlaceCard(
              title1: 'Golconda Fort',
              description:
                  'Golconda is a fortified citadel and ruined city located in the western outskirts of Hyderabad.',
              imagepath: 'assets/images/telangana/golconda.jpg',
              place: 'Golconda Fort'),
        ]),
      ),
    );
  }
}
