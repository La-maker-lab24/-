import 'package:flutter/material.dart';
import 'package:museum_app/modules/quests_module.dart';
import 'package:museum_app/userQuestScreen.dart';

class userCheckQuestionScreen extends StatefulWidget {
  final int questionIndex;
  final Function(bool) onAnswerSubmitted;
  final List<int> foundExhibitsList;
  final int questId;

  const userCheckQuestionScreen({
    Key? key,
    required this.questionIndex,
    required this.onAnswerSubmitted,
    required this.foundExhibitsList,
    required this.questId,
  }) : super(key: key);

  @override
  _userCheckQuestionScreenState createState() => _userCheckQuestionScreenState(foundExhibitsList: this.foundExhibitsList, questId: this.questId);
}

class _userCheckQuestionScreenState extends State<userCheckQuestionScreen> {
  TextEditingController _answerController = TextEditingController();
  String _errorMessage = '';
  List<int> foundExhibitsList;
  int questId;

  _userCheckQuestionScreenState({required this.foundExhibitsList, required this.questId});

  @override
  Widget build(BuildContext context) {
    //  String questionText = '';
    // String questionAnswer = '';
    // TODO дописать функцию, реализовать получение информации из БД
    // получаем информацию о текущем вопросе
    /*void getQuestionInfo(int questId, int index)
    {
      List<String> questionInfo = getQuestionInformation(questId, index);
      questionText = questionInfo[2];
      questionAnswer = questionInfo[3];
      print("questionInfo"+questionInfo.toString());
    }*/

    bool _isCorrectAnswer(String answer) {
      return answer.trim() == '18';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF252836),
        automaticallyImplyLeading: false, // Удалить иконку назад
        centerTitle: true, // Выровнять заголовок по центру
        title: Text('А расскажите нам о нём'),
      ),
      backgroundColor: Color(0xFF252836),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Какого века экспонат?',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _answerController,
              decoration: InputDecoration(
                hintText: 'Введите ответ',
                filled: true,
                fillColor: Color(0xFF252836),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10.0),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      // onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),

                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Отменить',
                      style: TextStyle(color: Colors.white), // Установка цвета текста на белый
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1AACBC),
                      // onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      String answer = _answerController.text;
                      bool isCorrect = _isCorrectAnswer(answer);
                      if (isCorrect) {
                        // getQuestionInfo(questId, widget.questionIndex);
                        widget.onAnswerSubmitted(true);
                        foundExhibitsList.add(widget.questionIndex+1);
                        // сохранение прогресса
                        updateQuest(questId, exhibitIndex: widget.questionIndex);
                        if (widget.questionIndex < 5) {
                          Navigator.pop(context);
                        }
                      } else {
                        setState(() {
                          _errorMessage = 'Ответ неверный. Попробуйте ещё раз.';
                        });
                      }
                    },
                    child: Text(
                      'Проверить',
                      style: TextStyle(color: Colors.white), // Установка цвета текста на белый
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
