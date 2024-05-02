import 'package:sqflite/sqflite.dart';
import 'package:museum_app/database/database_service.dart';
import 'package:museum_app/modules/quest.dart';
import 'dart:io';

class QuestDB {
  final tableName = 'quests';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "image" TEXT NOT NULL
    );""");
  }

  Future<int> create({required String name, required String description}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (name, description) VALUES (?, ?)''',
      [name, description],
    );
  }

  Future<List<Quest>> fetchAll() async {
    final database = await DatabaseService().database;
    final List<Map<String, dynamic>> quests = await database.rawQuery(
        "SELECT * FROM $tableName ORDER BY COALESCE(name, description)");
    return quests.map((quest) => Quest.fromSqfliteDatabase(quest)).toList();
  }

  Future<Quest> fetchById(int id) async {
    final database = await DatabaseService().database;
    final quest = await database.rawQuery(
        '''SELECT * FROM $tableName where id = ?''', [id]);
    return Quest.fromSqfliteDatabase(quest.first);
  }

  Future<int> update({required int id, String? name}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      {
        if (name != null) 'name': name,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''delete from $tableName where id = ?''', [id]);
  }

}
