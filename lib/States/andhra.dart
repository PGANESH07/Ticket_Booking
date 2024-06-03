import 'package:flutter/material.dart';
import 'package:tbs/booking/placecard1.dart';

class AndhraPradesh extends StatelessWidget {
  const AndhraPradesh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Andhra Pradesh',
        ),
      ),
      body: SingleChildScrollView(
        
          child: Column(children: [
            PlaceCard(
                title1: 'Lepakshi Bull',
                description:
                    'This is a huge statue of Nandi bull carved from sandstone, facing the Shiva statue in the main Veerabhadra temple in Lepakshi.',
                imagepath: 'assets/images/andhra/lepakshibull.jpg',
                place: 'Lepakshi Bull'),
            PlaceCard(
                title1: 'Amaravathi Stupa',
                description: 'Amaravathi Stupa is located in Amaravathi city of Guntur Disctrict, which was built in phases in between Second Century and third Century. ',
                imagepath: 'assets/images/andhra/amaravatistupa.jpg',
                place: 'Amaravathi Stupa'),
            PlaceCard(
                title1: 'Lepakshi Jataayu',
                description: 'A huge sculpture mounted on a rocky hill at the entrance of Lepakshi village.',
                imagepath: 'assets/images/andhra/lepakshijatayu.jpg',
                place: 'Lepakshi Jataayu'),
            PlaceCard(
                title1: 'Bojjana Konda',
                description: 'Contains numerous monolithic stupas, rock cut caves.',
                imagepath: 'assets/images/andhra/bojjanakonda.jpg',
                place: 'Bojjana Konda'),
          ]),
        ),
      
    );
  }
}