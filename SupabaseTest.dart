import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hpajczznwickbpcpxrik.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhwYWpjenpud2lja2JwY3B4cmlrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ4ODg0NzcsImV4cCI6MjAzMDQ2NDQ3N30.PsX65kLT8j1wbzHZc6cqo6QbCItKQ4pqkJhLQ9FIHKE',
  );
  // It's handy to then extract the Supabase client in a variable for later uses
  final supabase = Supabase.instance.client;
  Future read() async {
// select will return all the data in the Users Table
    final userData = await supabase.from('tblExhibit').select();
    print(userData);
    return userData;
  }
  read();
}

Future<void> createJsonFromDB() async {
  // List<Map<String, dynamic>> quests = await db.query('tblQuest');
  Map<String, dynamic> jsonMap = {};

  for (var quest in quests) {
    String questName = quest['name'];
    int questId = quest['idQuest'];

    Map<String, dynamic> questData = {
      'quest_id': questId,
      'description': quest['description'],
      'stat': '0',
      'img': 'lib/img/' + quest['imgLink'],
      'exhibits': {}
    };

    List<Map<String, dynamic>> exhibits = await db.rawQuery('''
      SELECT tblExhibit.idExhibit, tblEXhibit.imgLink, tblExtaQuestion.questionText
      FROM tblEXhibit
      INNER JOIN tblIExhibitsInQuest ON tblEXhibit.idExhibit = tblIExhibitsInQuest.idExhibit
      INNER JOIN tblExtaQuestion ON tblEXhibit.idExtraQuestion = tblExtaQuestion.idExtaQuestion
      WHERE tblIExhibitsInQuest.idQuest = $questId
    ''');

    for (var exhibit in exhibits) {
      String exhibitImg = exhibit['imgLink'];
      String questionText = exhibit['questionText'];
      int exhibitId = exhibit['idExhibit'];

      questData['exhibits'][exhibitImg] = ['q', questionText, exhibitId.toString()];
    }

    jsonMap[questName] = questData;
  }

  String jsonString = jsonEncode(jsonMap);
  print(jsonString);
}
