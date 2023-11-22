import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_de_contatos/components/contatct_tile.dart';
import 'package:lista_de_contatos/model/contacts_model.dart';
import 'package:lista_de_contatos/pages/new_contact_page.dart';
import 'package:lista_de_contatos/repositories/contact_list_repository.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _contact = <ContactsModel>[];
  ContactListRepository contactListRepository = ContactListRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    _contact = await contactListRepository.getContactDatabase();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de contatos'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _contact.length,
          itemBuilder: (BuildContext bc, int index) {
            var contact = _contact[index];
            return Dismissible(
              onDismissed: (DismissDirection dismissDirection) async {
                contactListRepository.remove(contact.id);
                setState(() {
                  
                  carregarDados();
                  });
              },
              key: UniqueKey(),
              child: ContatctTile(
                name: contact.name,
                phoneNumber: contact.phoneNumber,
                profilePicture: contact.profilePicture,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const NewContactPage()));
      }, child: const Icon(Icons.add),),
    );
  }
}
