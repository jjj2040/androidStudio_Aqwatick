import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled111/01Operator/01OperButtle/clasesGiveDate.dart';
import 'package:untitled111/firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'dimensions.dart';



int _aa = todoList1.length;

String _userToDo = '';
String _userLogo = '';
String _userType = '';
String _userNetto = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: MyTextPage()
    );
  }
}

class MyTextPage111 extends StatefulWidget {
  const MyTextPage111({super.key});

  @override
  State<MyTextPage111> createState() => _MyTextPage111State();
}

class _MyTextPage111State extends State<MyTextPage111> {
  @override

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }





  void initFireBase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  initState() {
    initFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Вернуться"),
        backgroundColor: Colors.grey[500],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: SingleChildScrollView(
          child: Column(

              // ЗАГОЛОВОК ЦЕХА
              children: [
                const Text(
                  'Пироговский, цех бутыли',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    //decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                //блок  с названием машины и ПОЛНЫМ СОДЕРЖАНИЕМ ЗАКАЗОВ

                Container(
                    //margin: const EdgeInsets.only(
                    //   left: 1.0, right: 1.0, top: 5.0, bottom: 5.0),
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9))),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.max,
                      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //строка с названием машины
                        _stroka1(),

                        //фраза 'Данные по выпуску продукции'
                        Container(
                          margin: const EdgeInsets.only(
                              left: 1.0, right: 1.0, top: 7.0, bottom: 7.0),
                          padding:
                              const EdgeInsets.only(top: 0, left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(9))),
                          child: Column(
                            children: [
                              _stroka6(),
                              _stroka4Oper(),
                              stroka2(),
                              _stroka8(),
                              _stroka3(), // процент готовой продукции

                              _buttonOrder2()
                            ],
                          ),
                        ),

                        // Блок добавления и вывода заказов
                        blockZakaz(),

                        //блок по записи ремонтных работ с машиной
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(9))),
                          child: Column(
                            children: [
                              _remontTitle(),
                              _remontBriefly(),
                              _buttonOrder2(),
                              outMetod(),

                            ],
                          ),
                        ),

                        _analitic()
                      ],
                    )),

                //ПРОБНЫЙ ПУСТОЙ БЛОК ДЛЯ ВЫВОДА ЛИСТ ВЬЮ
              ]),
        ),
      ),
    );
  }




  final int _qqq = 0;

  Widget _list3() {
    return Scrollbar(
      child: ListView(
        children: [
          // Text(todoList1[_count1()]),
          Text(todoList1.first),
          Text(todoList1[0]),
          Text(todoList1[1]),
          Text(todoList1[2]),
          Text(todoList1.last),
          Text(todoList1.last),
          Text(todoList1[_aa - 3]),
        ],
      ),
    );
  }




// Блок добавления и вывода заказов

  Widget blockZakaz() {
    return Container(
      margin:
          const EdgeInsets.only(left: 1.0, right: 1.0, top: 7.0, bottom: 7.0),
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(9))),

      child: Column(
        children: [
          _stroka5Order(),

          //окно вывода существующих заказов
          Container(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                //minHeight: 50.0,
                maxHeight: 90.0,
              ),

              child: newlist(),
            ),
          ),

          // КНОПКА ДОБАВЛЕНИЯ НОВОГО ЗАКАЗА
          _buttonNewOrder(),
        ],
      ),
      // ),
    );
  }

  // ОТОБРАЖЕНИЕ СОДЕРЖАНИЯ viewList
  Widget _list2() {
    return ListView.separated(
      itemCount: todoList1.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: height2);
      },
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(todoList1[index]),
          child: SizedBox(
            height: 45,
            child: Card(
              color: Colors.grey[300],
              child: ListTile(
                title: Text(todoList1[index]),
              ),
            ),
          ),

          /*   onDismissed:(direction){
          setState((){
            countOrder --;
            todoList1.removeAt(index);
          });
        },

     */
        );
      },
    );
  }

  // микс, отображение заказов из базы данных, основа c интернета, все новое, но дизайн старый
  Widget newlist() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('zakaznew').snapshots(),
        builder: (context, snapshot) {
          var clientWidgets = [];
          var idList = [];
          var countindex = [];
          // List clientWidgets = [];
          if (snapshot.hasData) {
            final clients = snapshot.data!.docs.reversed.toList();
            for (var client in clients) {
              var _userToDo1 = client['number'];
              var _userLogo1 = client['logo'];
              var _userType1 = client['type'];
              var _userNetto1 = client['netto'];
              var _userId = client['id'];
              var docId = client.id;
              clientWidgets.add(
                  '- $_userToDo1, $_userLogo1, $_userType1,  $_userNetto1'); // список для отображения данных
              idList.add(
                  docId); // список для id, потом по этому id происходит удаление.
            }
            for (var count in countindex) {
              var _count = count;
            }
          }

          return ListView.separated(
            itemCount: clientWidgets.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: height2);
            },
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(clientWidgets[index]),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                  //padding: const EdgeInsets.only(top: 0, left: 5, right: 5),

                  //height: 45,

                  child: Card(
                    margin: const EdgeInsets.only(
                        left: 1.0, right: 1.0, top: 1.0, bottom: 1.0),
                    //padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
                    color: Colors.grey[300],
                    child: ListTile(
                      title: Text(clientWidgets[index]),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  //clientWidgets.removeAt(index);
                  FirebaseFirestore.instance
                      .collection("zakaznew")
                      .doc(idList[index])
                      .delete();
                },
              );
            },
          );
        });
  }



  // КНОПКА 'ПОДРОБНО' ПО ВЫПУСКУ ПРОДУКЦИИ
  Widget _buttonOrder2() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(color: Colors.black12)))),
            onPressed: () {
              // ВСПЛЫВАЮЩЕЕ ОКНО ДЛЯ ВНЕСЕНИЯ ДАННЫХ
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _dialog1(); //_dialog диалоговое окно
                  });
            },
            child: const Text(
              'Подробно',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  // КНОПКА 'Аналитика' ПО ВЫПУСКУ ПРОДУКЦИИ
  Widget _analitic() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(color: Colors.black12)))),
            onPressed: () {
              // ВСПЛЫВАЮЩЕЕ ОКНО ДЛЯ ВНЕСЕНИЯ ДАННЫХ
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _analiticDetails(); //_dialog диалоговое окно
                  });
            },
            child: const Text(
              'Аналитика',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  // КНОПКА ДОБАВЛЕНИЕ НОВОГО ЗАКАЗА
  Widget _buttonNewOrder() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(color: Colors.black12)))),
            onPressed: () {
              // ВСПЛЫВАЮЩЕЕ ОКНО ДЛЯ ВНЕСЕНИЯ ДАННЫХ
              var intValue = Random().nextInt(10);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _dialog(); //_dialog диалоговое окно добавление нового заказа менеджером
                  });
            },
            child: const Text(
              'Добавить заказ',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  //--- ДИАЛОГОВОЕ ОКНО, ПОДРОБНО ПРО ВЫПУСК ПРОДУКЦИИ
  Widget _dialog1() {
    return AlertDialog(
      title: const Text('Выпуск продукции'),
      //child: ListView(
      content: ListView(
        children: [
          _itogSmeny(),
          _addOrderTime3(),
          _stroka4Oper(),
          _addOrder2(),
          _strokaDialogWindowOrder(),
          _stroka3(),
          _stroka__(),
          //--------
          _addOrderTime3(),
          _stroka4Oper(),
          _addOrder2(),
          _strokaDialogWindowOrder(),
          _stroka3(),
          _stroka__(),
          //---------
          _addOrderTime1(),
          _stroka4Oper(),
          _addOrder2(),
          _strokaDialogWindowOrder(),
          _stroka3(),
          _stroka__(),
          //---------

          _addOrder(),
          _stroka4Oper(),
          _addOrder2(),
          _strokaDialogWindowOrder(),
          _stroka3(),
          _stroka__(),
          //---------
        ],
      ),
      // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
      actions: [
        ElevatedButton(
            onPressed: () {
              //setState(() {
              //if (_userToDo != '') {
              //todoList1.add(
              //    '- $_userToDo, $_userLogo, $_userType, $_userNetto');
              // } else {

              // }

              //}
              // );

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
            },
            child: const Text('Закрытm')),
      ],
      //--------------------------------------
    );
  }

// 2ое диалоговое окно, информация вывод текста
  Widget _strokaDialogWindowOrder() {
    return Row(
      children: [stroka2()],
    );
  }

  //--- ДИАЛОГОВОЕ ОКНО ДОБАВЛЕНИЕ ЗАКАЗА
  Widget _dialog() {
    return AlertDialog(
      title: const Text('Добавление заказа'),

      //child: ListView(
      content: ListView(
        children: <Widget>[
          TextField(
            onChanged: (String value) {
              _userToDo = value;
            },
            decoration: const InputDecoration(hintText: "Количество"),
            textAlign: TextAlign.center,
          ),
          TextField(
            onChanged: (String value) {
              _userLogo = value;
            },
            decoration: const InputDecoration(hintText: "Логотип"),
            textAlign: TextAlign.center,
          ),
          TextField(
            onChanged: (String value) {
              _userType = value;
            },
            decoration:
                const InputDecoration(hintText: "Тип бутыли (X,G или др.)"),
            textAlign: TextAlign.center,
          ),
          TextField(
            onChanged: (String value) {
              _userNetto = value;
            },
            decoration: const InputDecoration(hintText: "Вес бутыли"),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА. ОТПРАВЛЯЕТ ДАННЫЕ В БАЗУ ДАННЫХ
      actions: [
        ElevatedButton(
            onPressed: () {
              int intValue1;
              intValue1 = Random().nextInt(100000000);
              int intValue2;
              intValue2 = Random().nextInt(100000000);
              int intValue22;
              intValue22 = Random().nextInt(100000000);
              var intValue3 = '';
              intValue3 = intValue1.toString() +
                  intValue2.toString() +
                  intValue22.toString();

              FirebaseFirestore.instance.collection('zakaznew').add({
                'number': _userToDo,
                'logo': _userLogo,
                'type': _userType,
                'netto': _userNetto,
                'id': intValue3,
              });

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
              _userToDo = '';
              _userLogo = '-';
              _userType = '-';
              _userNetto = '-';
            },
            child: const Text('ОТПРАВИТЬ11')),
      ],
      //--------------------------------------
    );
  }

  //--- ДИАЛОГОВОЕ ОКНО АНАЛИТИКИ
  Widget _analiticDetails() {
    return AlertDialog(
      title: const Text('Анализ данных'),
      //child: ListView(
      content: ListView(
        children: [
          Container(
              child: const Text(
                  'Здесь будет возможность строить графики и проводить аналитику по операторам, по машинам, по продукции. Но это потом.')),
          // ввести
        ],
      ),
      // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
      actions: [
        ElevatedButton(
            onPressed: () {
              setState(() {});

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
            },
            child: const Text('Закрыть')),
      ],
      //--------------------------------------
    );
  }

  Widget stroka2() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
          //padding: EdgeInsets.only(top: 0, left: 5, right: 5),
          child: Text(vRabote1,
              style: const TextStyle(fontSize: 13, color: Colors.black)),
        ),
      ],
    );
  }

  Widget _stroka__() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          child: const Text('-----------------',
              style: TextStyle(fontSize: 13, color: Colors.black)),
        ),
      ],
    );
  }

  Widget _stroka1() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: const Text('PL-1:',
              style: TextStyle(fontSize: 20, color: Colors.red)),
        ),
        read(),

      ],
    );
  }

  //чтение данных из FireBase, статус машины
  Widget read() {
    CollectionReference student =
        FirebaseFirestore.instance.collection('status');
    return FutureBuilder<DocumentSnapshot>(
        future: student.doc('MBCgykpboKR3gKg3YQ3c').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
           Map<String, dynamic> data =
           snapshot.data!.data() as Map<String, dynamic>;
           //-   ??{'mes1': "Tom1111"}) - эта часть возвращается если получает null.
           // До этого было- snapshot.data!.data() as Map<String, dynamic>;
                 var data1 = data['mes1'];

            return Text('$data1',
                style: TextStyle(fontSize: 15, color: Colors.orange));
          }

          return Text('Процесс загрузки...', style: TextStyle(fontSize: 20, color: Colors.orange));
        });
  }



  Widget _stroka3() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
          child: const Text('готово 50%, брак 12%',
              style: TextStyle(fontSize: 13, color: Colors.black)),
        ),
      ],
    );
  }

  Widget _stroka4Oper() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: const Text('Оператор: Иванов И.И.',
              style: TextStyle(fontSize: 13, color: Colors.black)),
        ),
      ],
    );
  }

  //строка "Заказы в очереди"  itemCount: todoList.length,
  Widget _stroka5Order() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Text('Заказы в очереди: $countOrder шт.',
              style: const TextStyle(fontSize: 18, color: Colors.black)),
        ),
      ],
    );
  }

  //строка "Данные по выпуску продукции"
  Widget _stroka6() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: const Text('Данные по выпуску продукции:',
              style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
      ],
    );
  }

  //строка "Данные по обслуживанию PL-1"
  Widget _remontTitle() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: const Text('Данные по обслуживанию PL-1:',
              style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
      ],
    );
  }

  //строка информации по последним данным выпуска продукции
  Widget _stroka7() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
          child: const Expanded(
              child: Text(
                  'Последнее добавление: 128 шт., брак - 15 шт, Время: 15:24, Дата: 21.03.2024 ',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ))),
        ),
      ],
    );
  }

  Widget _itogSmeny() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

          child: const Text('Итог смены:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red,
              )),
        ),
      ],
    );
  }

  Widget _addOrder() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

          child: const Text('Время: 12:00, Дата: 21.03.2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              )),
        ),
      ],
    );
  }

  Widget _addOrderTime1() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

          child: const Text('Время: 16:00, Дата: 21.03.2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              )),
        ),
      ],
    );
  }

  Widget _addOrderTime2() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

          child: const Text('Время: 20:00, Дата: 21.03.2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              )),
        ),
      ],
    );
  }

  Widget _addOrderTime3() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

          child: const Text('Время: 20:00, Дата: 21.03.2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              )),
        ),
      ],
    );
  }

  Widget _addOrder2() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 5),
          //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

          child: const Text('240 шт., брак 26 шт.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              )),
        ),
      ],
    );
  }

  Widget _stroka8() {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
      margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
      child: Row(
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.only(top: 0, left: 5, right: 5),
              //margin: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: const Expanded(
                  child: Text(
                      'Последнее добавление: 128 шт., брак - 15 шт, Время: 15:24, Дата: 21.03.2024',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                      textDirection: TextDirection.ltr)),
            )
          ]),
    );
  }

  Widget _remontBriefly() {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Row(
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.only(top: 0, left: 5, right: 5),
              //margin: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: const Expanded(
                  child: Text(
                      'Время: 15:24, Дата: 21.03.2024, Ремонт машины, тех.обслуживание, просушка сырья. 2 часа',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                      textDirection: TextDirection.ltr)),
            )
          ]),
    );
  }
}


