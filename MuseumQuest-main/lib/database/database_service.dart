import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:museum_app/database/quest_db.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'quest.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await QuestDB().createTable(db);
      },
      singleInstance: true,
    );
    return database;
  }
}
