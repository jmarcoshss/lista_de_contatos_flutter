import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

Map<int, String> scripts = {
  1: ''' CREATE TABLE contacts (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          phoneNumber TEXT,
          profilePicture TEXT
          );'''
};

class ContactListDataBase {
  static Database? db;

  Future<Database> getDatabase() async {
    if (db == null) {
      return await startDatabase();
    } else {
      return db!;
    }
  }

  Future<Database> startDatabase() async {
    var db = await openDatabase(
        path.join(await getDatabasesPath(), 'database.db'),
        version: scripts.length, onCreate: (Database db, int version) async {
      for (var i = 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
      }
    });
    return db;
  }
}