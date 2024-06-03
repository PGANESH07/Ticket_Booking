import 'package:flutter/material.dart';
import 'package:tbs/booking/placecard1.dart';

class Maharashtra extends StatelessWidget {
  const Maharashtra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maharashtra',
        ),
      ),
      body: SingleChildScrollView(
        
          child: Column(children: [
            PlaceCard(
                title1: 'Ajanta Caves',
                description:
                    'The Ajanta Caves are situated at a distance of 107 km north of Aurangabad, the district headquarters. The caves attained the name from a nearby village named Ajanta located about 12 km.',
                imagepath: 'assets/images/maharashtra/ajantacaves.jpg',
                place: 'Ajanta Caves'),
            PlaceCard(
                title1: 'Ellora Caves',
                description: 'The Ellora caves, locally known as ‘Verul Leni’ is located on the Aurangabad-Chalisgaon road at a distance of 30 km north-northwest of Aurangabad, the district headquarters.',
                imagepath: 'assets/images/maharashtra/elloracaves.jpg',
                place: 'Ellora Caves'),
            PlaceCard(
                title1: 'Aga Khan Palace',
                description: 'Aga Khan Palace is major attraction of photographers for various kind of photo shoot because of its special architecture, greenery and perfect for photography lighting.',
                imagepath: 'assets/images/maharashtra/agakhanpalace.jpg',
                place: 'Aga Khan Palace'),
            PlaceCard(
                title1: 'Raigad Fort',
                description: 'Raigad, situated in the Raigad district of Maharashtra, India, is a hill fort located in the town of Mahad. It is one of the strongest fortresses on the Deccan Plateau.',
                imagepath: 'assets/images/maharashtra/raigadfort.jpg',
                place: 'Raigad Fort'),
          ]),
        ),
      
    );
  }
}