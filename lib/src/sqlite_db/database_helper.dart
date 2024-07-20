import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static final DatabaseHelper instance = DatabaseHelper._instance();

  Database? _database;

  DatabaseHelper._instance(){
    _initDatabase();
  }

  // 이 생성자도 쓸 수 있게 함
  factory DatabaseHelper(){
    return instance;
  }

  // db 가져오기
  Future<Database> get database async {
    if(_database != null) return _database!;
    await _initDatabase();
    return _database!;
  }

  // 초기화
  Future<void> _initDatabase() async{
    var dataDasePath = await getDatabasesPath();
    String path = join(dataDasePath, 'geulnarae.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _databaseCreate
    );
  }

  void _databaseCreate(Database db, int version) async{
    await db.execute('''
        CREATE TABLE writings(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT, 
          main TEXT
        )
    ''');
  }

  void closeDatabase() async{
    if(_database != null) await _database!.close();
  }


}