import 'package:flutter/material.dart';
import 'package:museum_app/theme/theme.dart';
import 'package:museum_app/userHomeScreen.dart';
import 'package:museum_app/userSupportScreen.dart';
import 'package:museum_app/userQuestScreen.dart';
import 'package:museum_app/userNewQuestVersion.dart';
import 'package:museum_app/userQuestWasDeleted.dart';
import 'package:museum_app/ui_widgets/quest_widget.dart';
import 'package:museum_app/modules/quests_module.dart';

class userHomeScreen extends StatefulWidget {
  const userHomeScreen({Key? key}) : super(key: key);

  @override
  State<userHomeScreen> createState() => _userHomeScreenState();
}

class _userHomeScreenState extends State<userHomeScreen> {
  int _selectedIndex = 0;
  List<List<String>> questInfoList = [];
  @override
  void initState() {
    super.initState();
    _loadQuestInformation();
  }

  Future<void> _loadQuestInformation() async {
    List<List<String>> quests = await getQuestsInformation();
    setState(() {
      questInfoList = quests;
    });
  }//getQuestsInformation();

  final List<Widget> _screens = [
    userHomeScreen(),
    userSupportScreen(), // Замененный элемент
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Добавляем проверку индекса и перенаправляем пользователя на соответствующий экран
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => userSupportScreen()),
        );
      }
    });
  }

  // получаем список виджетов для квестов
  Future<List<Widget>> getQuestWidgetList()
  {
    List<Widget> questWidgetList = [];
    List<List<String>> questInfoList = [];//getQuestsInformation();
    @override
    void initState() {
      super.initState();
      _loadQuestInformation();
    }
    for (final element in questInfoList)
    {
      List<int> foundExhibitsList = [];
      int id = int.parse(element[0]);
      String title = element[1];
      String description = element[2];
      String imagePath = element[3];
      String status = "0";//getQuestStatus(id);
      Future<void> _getQuestInfo(id) async {
        String stat = await getQuestStatus(id);
        setState(() {
          status = stat;
        });
      }
      Future<void> _getFoundExhibits(id) async {
        List<int> l = await getFoundExhibits(id);
        setState(() {
          foundExhibitsList = l;
        });
      }
      @override
      void initState() {
        super.initState();
        _loadQuestInformation();
        _getQuestInfo(id);
        _getFoundExhibits(id);
      }

      String buttonText;
      Widget destinationScreen;

      if (status == '0')
      {
        buttonText = 'Начать';
        destinationScreen = userQuestScreen(foundExhibitsList: [], questId: id);
      }
      else if (status == '1')
      {
        buttonText = 'Продолжить';
        foundExhibitsList = []; //getFoundExhibits(id);
        destinationScreen = userQuestScreen(foundExhibitsList: foundExhibitsList, questId: id);
      }
      else {
        buttonText = 'Пройти ещё раз';
        destinationScreen = userQuestScreen(foundExhibitsList: [], questId: id);
      }

      questWidgetList.add(
          buildCardWithBackground(
            context,
            status,
            imagePath,
            title,
            description,
            buttonText,
            destinationScreen,
            onContinuePressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destinationScreen),
              );
            },
            onRestartPressed: () {
              if (status == '1')
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userQuestScreen(foundExhibitsList: [], questId: id)),
                );
              }
            },
          ));
    }
    return Future.value(questWidgetList);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList = [];
    Future<void> _loadWidgets() async {
      List<Widget> w = await getQuestWidgetList();
      setState(() {
        widgetList = w;
      });
    }
    @override
    void initState() {
      super.initState();
      _loadWidgets();
    }
    //getQuestWidgetList();

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1F1D2B),
          automaticallyImplyLeading: false, // Удалить иконку назад
          centerTitle: true, // Выровнять заголовок по центру
          title: Text('Квесты'),
        ),
        body: ListView.builder(
          itemCount: widgetList.length,
          itemBuilder: (BuildContext context, int index)
          {
            return widgetList[index];
          }
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Квесты',
              icon: Image.asset(
                'lib/img/icons/quests.png',
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/img/icons/support.png',
              ),
              label: 'Поддержка',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTapped,
        ),
      ),
    );
  }
}