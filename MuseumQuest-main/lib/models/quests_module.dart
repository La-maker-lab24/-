import 'package:flutter/material.dart';
import 'package:museum_app/ui_widgets/quest_widget.dart';

// TO-DO: описать получение данных из БД и их передачу в questsWidgetList
Future<List<Widget>> getQuests() async {
  // Map<String, List<String>> questData = {};
  List<Widget> questsWidgetList = [];

  // получаем данные
  /*for (final quest in questData.entries)
  {
    questsWidgetList.add(QuestCard(questId: '1', questName: 'Квест1', questDescription: 'Описание 1'));
  }*/
  questsWidgetList.add(QuestCard(questId: '1', questName: 'Изобретения', questDescription: 'Лодки, инструменты, украшения из меди и многое другое', questStatus: '0', imgSrc: 'lib/img/quest1Img.png'));
  questsWidgetList.add(QuestCard(questId: '2', questName: 'Одежда', questDescription: 'Традиционная одежда, украшения, вышивка и ткачество', questStatus: '1', imgSrc: 'lib/img/quest2Img.png'));
  return questsWidgetList;
}

// ------------------------------ Вариант 1 -----------------------
// Настройка подключения
// Future<PostgreSQLConnection> connectToDatabase() async {
//   const host = 'localhost';
//   const port = 5432;
//   const username = 'museum';
//   const password = '138138';
//   const databaseName = '138138';

//   final connection = PostgreSQLConnection(
//     host,
//     port,
//     databaseName,
//     username: username,
//     password: password,
//   );
//   await connection.open();
//   return connection;
// }

// // Закрыть подключение
// Future<void> closeConnection(PostgreSQLConnection connection) async {
//   await connection.close();
// }

// ----------------------- Варианты 2-3 --------------------------------
// class DatabaseHelper {
//   static Database? _database;
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     // Укажите путь к файлу базы данных
//     String path = 'C:/Users/murza/AndroidStudioProjects/ggg/museum_db.sql';
//     if (Platform.isIOS) path = 'C:/Users/murza/AndroidStudioProjects/ggg/museum_db.sql';
//
//     // // Откройте или создайте базу данных
//     // _database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
//     //   // Создайте таблицы и вставьте данные
//     // });
//
//     return _database!;
//   }
// }
//
// void main() async {
//   final database = await DatabaseHelper().database;
// }

// ----------------------------- Еще одна попытка ----------------------
// Future<void> main() async {
//   var db = await openDatabase('my_db.db');
//     final connection = PostgreSQLConnection(
//       '127.0.0.1', // Replace with your database host
//       5433, // Replace with your database port
//       'museum', // Replace with your database name
//       username: 'postgres',
//       password: '138138', // Replace with your password
//     );

// ---------------------------try-catch -----------------------------------
//     // try {
//     //   await connection.open();
//     //   // Execute queries...
//     // } on PostgreSQLException catch (e) {
//     //   print('Error: ${e.toString()}');
//     // } finally {
//     //   await connection.close();
//     }
// }
