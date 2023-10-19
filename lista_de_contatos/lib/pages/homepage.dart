import 'package:flutter/material.dart';
import 'package:lista_de_contatos/components/contatct_tile.dart';

class Homepage extends StatelessWidget {

  const Homepage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Lista de contatos'),),
           body: ListView(
            children: [
              Column(
                children: [
                  ContatctTile(),
                  ContatctTile(),
                ],
              )
            ],
           ),
       );
  }
}