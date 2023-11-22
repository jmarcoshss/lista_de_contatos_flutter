import 'dart:io';

import 'package:flutter/material.dart';

class ContatctTile extends StatelessWidget {
  ContatctTile(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.profilePicture});

  String name = '';
  String phoneNumber = '';
  String profilePicture = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              height: 50,
               child: ClipRRect(
                 child: profilePicture != ''
                     ? Image.file(File(profilePicture), fit: BoxFit.cover,)
                     : Image.asset('assets/image/nophoto.jpg',fit: BoxFit.cover,),
               ),
            ),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("nome : $name"), Text("numero:$phoneNumber")],
            )
          ],
        ),
      ),
    );
  }
}
