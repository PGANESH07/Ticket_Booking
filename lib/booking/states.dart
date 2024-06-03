import 'package:flutter/material.dart';
import 'package:tbs/States/andhra.dart';
import 'package:tbs/States/gujarat.dart';
import 'package:tbs/States/maharashtra.dart';
import 'package:tbs/States/tamilnadu.dart';
import 'package:tbs/States/telangana.dart';
import 'package:tbs/States/westbengal.dart';

import 'package:tbs/booking/placecard.dart';

class States extends StatefulWidget {
  const States({super.key});

  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Telangana()));
          },
          child: placeCard(
            title1: "Telangana",
            description:
                "Telangana is a state located in southern India, formed in 2014 after its bifurcation from Andhra Pradesh. It has a rich cultural and historical heritage, with a mix of modernity and tradition. ",
            imagepath: "assets/images/telangana.gif",
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const  AndhraPradesh()));
          },
          child: placeCard(
            title1: "Andhra Pradesh",
            description:
                "Andhra Pradesh, nestled in the southeastern part of India, is a vibrant destination that seamlessly blends rich history, diverse cultures, and picturesque landscapes.",
            imagepath: "assets/images/andhrapradesh.gif",
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>const  TamilNadu()));
          },
          child: placeCard(
              title1: "TamilNadu",
              description:
                  "Tamil Nadu, located in the southern part of India, is a vibrant state with a rich tapestry of history, culture, and natural beauty, making it an enticing destination for tourists.",
              imagepath: "assets/images/tamilnadu.gif"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>const  WestBengal()));
          },
          child: placeCard(
              title1: "West Bengal",
              description:
                  "West Bengal, located in the eastern part of India, offers a diverse and vibrant experience for tourists. ",
              imagepath: "assets/images/westbengal.gif"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Maharashtra()));
          },
          child: placeCard(
              title1: "Maharashtra",
              description:
                  "Maharashtra, nestled in the western part of India, is a state that unfolds like a vibrant tapestry, weaving together ancient heritage, bustling cities, and breathtaking landscapes for the avid traveler.",
              imagepath: "assets/images/maharashtra.gif"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Gujarat()));
          },
          child: placeCard(
              title1: "Gujarat",
              description:
                  "Gujarat, situated in the western part of India, is a captivating blend of ancient traditions and modern progress. As a traveler, you'll find a diverse tapestry of culture, history, and natural beauty waiting to be explored.",
              imagepath: "assets/images/gujarat.gif"),
        ),
      ],
    ));
  }
}
