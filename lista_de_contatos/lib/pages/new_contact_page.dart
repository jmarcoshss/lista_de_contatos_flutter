import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_de_contatos/model/contacts_model.dart';
import 'package:lista_de_contatos/pages/homepage.dart';
import 'package:lista_de_contatos/repositories/contact_list_repository.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  TextEditingController nameControlller = TextEditingController();

  TextEditingController phoneNumberControlller = TextEditingController();

  TextEditingController profilePictureControlller = TextEditingController();
  ContactListRepository contactListRepository = ContactListRepository();
  XFile? photo;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                      label: Text('Nome'), border: OutlineInputBorder()),
                  controller: nameControlller,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                      label: Text('Numero do telefone'),
                      border: OutlineInputBorder()),
                  controller: phoneNumberControlller,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          _takePhoto();
                        },
                        icon: const Icon(Icons.camera_alt)),
                    IconButton(
                        onPressed: () {
                          _takeFromGallery();
                        },
                        icon: const Icon(Icons.image))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.blue)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: photo != null
                        ? Image.file(File(photo!.path), fit: BoxFit.cover)
                        : Image.asset('assets/image/nophoto.jpg'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await contactListRepository.save(ContactsModel(
                          0,
                          nameControlller.text,
                          phoneNumberControlller.text,
                          photo != null ? photo!.path : ""));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()));
                    },
                    child: const Text("salvar"))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _takePhoto() async {
    photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      String path =
          (await path_provider.getApplicationDocumentsDirectory()).path;
      String name = basename(photo!.path);
      await photo!.saveTo("$path/$name");

      await GallerySaver.saveImage(photo!.path);
      setState(() {});
    }
  }

  void _takeFromGallery() async {
    photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
