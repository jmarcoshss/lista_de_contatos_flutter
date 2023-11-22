
import 'package:lista_de_contatos/database/contact_list_database.dart';
import 'package:lista_de_contatos/model/contacts_model.dart';

class ContactListRepository {
  Future<List<ContactsModel>> getContactDatabase() async {
    List<ContactsModel> contacts = [];
    var db = await ContactListDataBase().getDatabase();
    var result = await db.rawQuery('SELECT id, name, phoneNumber, profilePicture FROM contacts');
    for (var element in result) {
      contacts.add(
        ContactsModel(
          int.parse(element['id'].toString()),
          element['name'].toString(),
          element['phoneNumber'].toString(),
          element['profilePicture'].toString(),
          
        ),
      );
    }
    return contacts;
  }

  Future<void> save(ContactsModel contact) async {
    var db = await ContactListDataBase().getDatabase();
    await db.rawInsert(
        'INSERT INTO contacts(name, phoneNumber, profilePicture) values(?,?,?)',
        [contact.name, contact.phoneNumber, contact.profilePicture]);
  }
  Future<void> remove(int id) async {
    var db = await ContactListDataBase().getDatabase();
    await db.rawInsert(
        'DELETE FROM contacts WHERE id = ?',
        [id]);
  }
}