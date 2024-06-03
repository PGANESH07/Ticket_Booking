import 'package:flutter/material.dart';
import 'package:tbs/booking/placecard1.dart';

class WestBengal extends StatelessWidget {
  const WestBengal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'West Bengal',
        ),
      ),
      body: SingleChildScrollView(
        
          child: Column(children: [
            PlaceCard(
                title1: 'Koch Bihar Palace',
                description:
                    'The Palace built by Maharaja Nripendranarayan in 1887 situated within a vast enclosure had sprawling gardens on all sides and some tanks. ',
                imagepath: 'assets/images/bengal/kochbihar.JPG',
                place: 'Koch Bihar Palace'),
            PlaceCard(
                title1: 'Hazarduari Palace',
                description: 'Hazarduari Palace, earlier known as the Bara Kothi, is located in the campus of Kila Nizamat in Murshidabad,situated near the bank of river Ganges.',
                imagepath: 'assets/images/bengal/hazarduari.jpg',
                place: 'Hazarduari Palace'),
            PlaceCard(
                title1: 'Bishnupur Group of Temples',
                description: 'Bishnupur, is celebrated for a large number of brick built temples representing all varieties of structural forms of medieval Bengali temple architecture.',
                imagepath: 'assets/images/bengal/bishnupurtemple.jpg',
                place: 'Bishnupur Group of Temples'),
            
          ]),
        ),
      
    );
  }
}