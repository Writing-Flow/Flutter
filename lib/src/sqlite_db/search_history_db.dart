import 'dart:developer';

import 'package:geulnarae/src/sqlite_db/database_helper.dart';

class SearchHistoryDb{
  static Future<List<Map<String, dynamic>>> selectAll() async {
    var db = await DatabaseHelper().database;
    return await db.rawQuery('SELECT * FROM searchhistory');
  }

  static Future<void> insertSearchHistory(String searchstring) async {
    var db = await DatabaseHelper().database;
    await db.rawInsert('INSERT INTO searchhistory(searchstring) VALUES(?)', [searchstring]);
    log('insertSearchHistory() - searchstring : $searchstring');
  }

  static Future<void> deleteSearchHistory(String searchstring) async{
    var db = await DatabaseHelper().database;
    await db.execute('delete from searchhistory where searchstring = ?', [searchstring]);
    log('deleteSearchHistory() - searchstring : $searchstring');
  }
}
