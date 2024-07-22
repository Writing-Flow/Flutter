import 'package:geulnarae/src/sqlite_db/database_helper.dart';

class WritingDb{
  static Future<List<Map<String, dynamic>>> selectAll() async {
    var db = await DatabaseHelper().database;
    return await db.rawQuery('SELECT * FROM writings');
  }

  static Future<void> insertWriting(String title, String main) async {
    var db = await DatabaseHelper().database;
    await db.execute('INSERT INTO writings(title, main) VALUES(?, ?)', [title, main]);
  }
}