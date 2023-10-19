import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  TextEditingController nameControlller = TextEditingController();

  TextEditingController phoneNumberControlller = TextEditingController();

  TextEditingController profilePictureControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      body: Padding(
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
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.url,
              onChanged: (text) {
                setState(() {});
              },
              controller: profilePictureControlller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Foto do perfil'),
              ),
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
                  child: Image.network(
                    profilePictureControlller.text,
                    errorBuilder: (BuildContext context, Object exeption,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/image/nophoto.jpg');
                    },
                    fit: BoxFit.cover,
                  )),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("salvar"))
          ],
        ),
      ),
    );
  }
}
