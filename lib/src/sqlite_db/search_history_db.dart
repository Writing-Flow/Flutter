import 'package:geulnarae/src/sqlite_db/database_helper.dart';

class SearchHistoryDb{
  static Future<List<Map<String, dynamic>>> selectAll() async {
    var db = await DatabaseHelper().database;
    return await db.rawQuery('SELECT * FROM searchhistory');
  }

  static Future<void> insertWriting(String searchstring) async {
    var db = await DatabaseHelper().database;
    await db.execute('INSERT INTO searchhistory(searchstring) VALUES(?)', [searchstring]);
  }
}
