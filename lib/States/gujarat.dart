import 'package:flutter/material.dart';
import 'package:tbs/booking/placecard1.dart';

class Gujarat extends StatelessWidget {
  const Gujarat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gujarat',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          PlaceCard(
              title1: 'Rani-Ki-Vav',
              description:
                  'Rani-ki-Vav (the Queen’s Stepwell) at Patan, Gujarat is located on the banks of the Saraswati River and was initially built as a memorial to a king in the 11th century AD',
              imagepath: 'assets/images/gujarat/ranikivav.jpg',
              place: 'Rani-Ki-Vav'),
          PlaceCard(
              title1: 'Sun Temple',
              description:
                  'Sun temple at Modhera is an architectural land mark being the earliest Solanki temple of Gujarat datable to A.D. 1026-27.',
              imagepath: 'assets/images/gujarat/suntemple.jpg',
              place: 'Sun Temple'),
          PlaceCard(
              title1: 'Buddist Caves',
              description:
                  'These cave groups comprise of several caves worked out in different groups with the construction period ranging from 1st -4th century A.D.',
              imagepath: 'assets/images/gujarat/buddhistcaves.jpg',
              place: 'Buddhist Caves'),
          PlaceCard(
              title1: 'Ashokan Rock Edict',
              description:
                  'The Rock edicts of Emperor Ashokan were engraved on a granite boulder on the slope of Girinagara or Urjayata Hill. ',
              imagepath: 'assets/images/gujarat/ashokarockedict.jpg',
              place: 'Ashokan Rock Edict'),
        ]),
      ),
    );
  }
}
