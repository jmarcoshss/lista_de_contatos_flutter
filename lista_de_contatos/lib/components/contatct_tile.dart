import 'package:flutter/material.dart';

class ContatctTile extends StatelessWidget {

  const ContatctTile({ super.key });

   @override
   Widget build(BuildContext context) {
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("nome : jadadelson"),
                  Text("numero:321456879")
                ],
              )
            ],
          ),
         ),
       );
  }
}