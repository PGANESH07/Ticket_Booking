// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'learning flutter',
            style: TextStyle(
                color: Color( 0xFF451952)),
          ),
          backgroundColor: Color( 0xFFbd83b8),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Container(padding: EdgeInsets.all(8.0),
                    child: Image.asset('images/hyderabad.png'),),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Container(padding: EdgeInsets.all(8.0),
                    child: Image.asset('images/hyderabad.png'),),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Card(child: Container(padding: EdgeInsets.all(8.0),child: Image.asset('images/hyderabad.png'),),))
              ,
              Expanded(child: Card(child: Container(padding: EdgeInsets.all(8.0),child: Image.asset('images/hyderabad.png'),),))],
            )
          ],),
        )
           /*Column(
            children: [
              
                
                  Row(children: [
                    
                      
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Hyderabad())),
                          child: Expanded(
                            child: Card(
                              child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset('images/hyderabad.png')),
                            ),
                          ),
                        ),
                        
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Mumbai())),
                          child: Expanded(
                            child: Card(
                                child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset('images/mumbai.png'),
                            )
                                //padding:EdgeInsets.all(8.0),
                          
                                ),
                          ),
                        ),
                        ]),
                )
                    
                  
                  /*Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Kolkata())),
                        child: Card(
                            child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset('images/kolkata.png'),
                        )
                            //padding:EdgeInsets.all(8.0),

                            ),
                      ),
                      const Text('Kolkata'),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Chennai())),
                        child: Card(
                            child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset('images/chennai.png'),
                        )
                            //padding:EdgeInsets.all(8.0),

                            ),
                      ),
                      const Text('Chennai'),
                    ],
                  )*/
        
            ],
          ),*/
          
        );
  }
  /*@override
  Widget build1(BuildContext context){
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Text('list 1'),
        Text('list 2'),
        Text('list 3'),
      ],
    );
  }*/


}

class Hyderabad extends StatelessWidget {
  const Hyderabad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hyderabad'),
      ),
      body: Column(children: [
        Card(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(0.5)),
          child: const Text('charminar'),
        ),
        Card(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(0.5)),
          child: const Text('golconda'),
        )
      ]),
    );
  }
}

class Mumbai extends StatelessWidget {
  const Mumbai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mumbai'),
      ),
      body: Column(children: [
        Card(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(0.5)),
          child: const Text('India Gate'),
        )
      ]),
    );
  }
}

class Kolkata extends StatelessWidget {
  const Kolkata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kolkata'),
      ),
      body: Column(children: [
        Card(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(0.5)),
          child: const Text('Howrah Bridge'),
        )
      ]),
    );
  }
}

class Chennai extends StatelessWidget {
  const Chennai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chennai'),
      ),
      body: Column(children: [
        Card(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(0.5)),
          child: const Text('Marina beach'),
        )
      ]),
    );
  }
}
