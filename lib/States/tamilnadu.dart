import 'package:flutter/material.dart';
import 'package:tbs/booking/placecard1.dart';

class TamilNadu extends StatelessWidget {
  const TamilNadu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tamil Nadu',
        ),
      ),
      body: SingleChildScrollView(
        
          child: Column(children: [
            PlaceCard(
                title1: 'Chola Temple',
                description:
                    'The celebrated Saiva temple at Thanjavur, appropriately called Brihadisvara and Daksinameru, is the grandest creation of the Chola emperor Rajaraja.',
                imagepath: 'assets/images/tamil/cholatemple.jpg',
                place: 'Chola Temple'),
            PlaceCard(
                title1: 'Dindigul Fort',
                description: 'Dindigul located about 400 km from Chennai, is a strategic place located overlooking the valley through which the forces from Karnataka country gained access into the Madurai in late medieval period.',
                imagepath: 'assets/images/tamil/dindigulfort.jpg',
                place: 'Dindigul Fort'),
            PlaceCard(
                title1: 'Thirumayam Fort',
                description: 'Sethupati Vijaya Raghunatha Tevan (1673-1708) of Ramanathapuram, popularly known as Kilavan Sethupati, built this fortification on and around the small hillock at Tirumayam in Pudukkottai district.',
                imagepath: 'assets/images/tamil/thirumayamfort.jpg',
                place: 'Thirumayam Fort'),
            PlaceCard(
                title1: 'Rock-cut Siva Temple',
                description: 'The cave-temple dedicated to Siva has a sanctum with a lingam cut out of the parent rock opening sideways into the ardha-mandapa.',
                imagepath: 'assets/images/tamil/shiva.jpg',
                place: 'Rock-cut Siva Temple'),
          ]),
        ),
      
    );
  }
}