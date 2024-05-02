import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:museum_app/database/database_service.dart';
import 'package:museum_app/modules/quest.dart';
import 'package:museum_app/database/database_service.dart';
import 'package:museum_app/database/quest_db.dart';

class QuestsPage extends StatefulWidget {
  const QuestsPage({super.key});

  @override
  State<QuestPage> createState() => _QuestsPageState();

}

class QuestsPageState extends State<QuestsPage> {
  Future<List<Quest>>? futureQuests;
  final QuestDB = QuestDB();

  @override





}

