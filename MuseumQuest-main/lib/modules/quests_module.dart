import 'dart:io';

import 'package:flutter/material.dart';
import 'package:museum_app/ui_widgets/quest_widget.dart';
import 'package:museum_app/controllers/db_controller.dart';

import 'dart:convert';

int startTime = 0, finishTime = 0, resultTime = 0;

// возвращает список, содержащий списки вида: [название_кветса, описание_кветса, путь_до_фоновой_картинки]
List<List<String>> getQuestsInformation() {
  // "сырая" информация из бд (функция вызывается из db_controller.dart)
  Map<String, dynamic> questsData = getQuestsInfo();
  // информация для построения виджета квеста
  List<List<String>> questInfoList = [];

  // по всем квестам, где key - название квеста, а value - информация о квесте
  for (final element in questsData.entries)
  {
      String id = element.value['quest_id'].toString();
      String description = element.value['description'];
      String imagePath = element.value['img'];
      String status = element.value['stat'];
      questInfoList.add([id, element.key, description, imagePath, status]);
  }

  return questInfoList;
}

// TODO: функция для получения дельты между скачанными квестами и квестами пользователя


// функция возвращает найденные пользователем экспонаты для одного квеста
List<int> getFoundExhibits(int questId) {
  // считываем данные из json файла
  // File file = File('lib/assets/progress.json');
  // String jsonString = file.readAsStringSync();

  // Map<String, dynamic> jsonData = jsonDecode(jsonString);

  var jsonData = jsonString;

  var quests = jsonDecode(jsonData);
  List<int> resultList = [];

  for (var quest in quests["quests"])
    if (quest["quest_id"] == questId)
    {
      List<dynamic> foundExhibits = quest["found_exhibits"];
      
      for(var exhibit in foundExhibits)
      {
        resultList.add(exhibit);
      }
      break;
    }

  return resultList;
}

// получение списка найденных экспонатов
List<bool> getCorrectCardList(List<int> foundExhibitsList) {
  List<bool> correctCardList = [];

  for (int i = 0; i < 6; i++)
    correctCardList.add(false);

  if (foundExhibitsList.length != 0)
    for (int i in foundExhibitsList)
      correctCardList[i-1] = true;

  return correctCardList;
}

// получение информации о квесте
String getQuestInfo(int questId,
    {
      String? questInfo
    }
    )
{
  var jsonData = jsonString;
  var data = json.decode(jsonData);

  List<dynamic> quests = data['quests'];
  for (var quest in quests)
  {
    if (quest["quest_id"] == questId)
    {
      switch(questInfo)
      {
        case "status":
          return quest["status"].toString();
        case "time":
          return quest["completion_time"].toString();
        default:
          return '';
      }
    }
  }
  return '';
}

// изменение информации о квесте
// reset - для сброса прогресса квеста
// exhibitIndex - для сохранения прогресса прохождения (добавление экспоната с индексом exhibitIndex в найденные)
// newStatus - для установки нового статуса квеста
// resultTime - для сохранения времени прохождения квеста
void updateQuest(
    int questId,
    {
      String? newStatus,
      int? exhibitIndex,
      bool? reset,
      int? time,
    })
{
  var jsonData = jsonString;
  var data = json.decode(jsonData);

  List<dynamic> quests = data['quests'];
  for (var quest in quests)
  {
    if (quest["quest_id"] == questId)
    {
      if (exhibitIndex != null)
      {
        quest["found_exhibits"].add(exhibitIndex + 1);
        break;
      }
      if (newStatus != null)
      {
        quest["status"] = newStatus;
        break;
      }
      if (reset != null)
      {
        quest["found_exhibits"] = [];
        break;
      }
      if (resultTime != null)
      {
        quest["completion_time"] = time;
        break;
      }
    }
  }

  jsonString = json.encode(data);
}

void startTimer() {
  startTime = DateTime.now().millisecondsSinceEpoch;
}

void stopTimer() {
  finishTime = DateTime.now().millisecondsSinceEpoch;
}

// переделать функцию на void????
int getResultTime(int questId)
{
  int prevResultTime = 0;
  String prevQuestTime = getQuestInfo(questId, questInfo: "time");
  // если квест был продолжен, то получаем предыдущее время прохождения
  if (getQuestInfo(questId, questInfo: "status") == '1')
  {
    if(prevQuestTime != 'null')
      {
        prevResultTime = int.parse(prevQuestTime);
      }
  }


  if (startTime != 0 && finishTime != 0)
  {
    // получаем результат в минутах
    resultTime = (prevResultTime + (finishTime - startTime) ~/ 60000);
    // записываем результат в минутах
    updateQuest(questId, time: resultTime);
    print("result time " + resultTime.toString());
    // возвращаем результат в минутах
    return resultTime;
  }
  return 0;
}
