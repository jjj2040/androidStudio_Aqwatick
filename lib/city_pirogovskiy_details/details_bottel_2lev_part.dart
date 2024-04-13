

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:untitled111/01_Operator_PL1/01OperButtle/FireBase/clasesGiveDate.dart';
import 'package:untitled111/01_Operator_PL1/01OperButtle/widgets/list.dart';
import 'package:untitled111/data/dataPartOrder.dart';
import 'package:untitled111/nameOperator.dart';
import 'package:untitled111/firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled111/func/funcData.dart';
import 'dimensions.dart';
import 'serviceMashine.dart';
import 'package:intl/intl.dart';



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
  State<MyTextPage111> createState() => MyTextPage111State();
}

class MyTextPage111State extends State<MyTextPage111> {
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

                      children: [
                        //строка с названием машины и ее статусом
                        readStatus(),

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
                              nameOperator11(),
                              orderNow(),
                              GiveOrderForOperator().giveBaseOrderForOperator() , //заказ сколько надо сделать
                              displaySummaDataOrder11(), // сделано и брак

                              _buttonOrder2()
                            ],
                          ),
                        ),

                        // Блок добавления и вывода заказов
                        blockZakaz(),
                        //ServiceMashine().remontTitle1(),

                        //блок по записи ремонтных работ с машиной
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(9))),
                          child: Column(
                            children: [
                              remontTitle(),
                              buttonServiceAdd(),
                              buttonServiceRead()
                              //buttonServiceMashine1(),
                              //GiveDataMashine().giveDataStatus(),

                            ],
                          ),
                        ),

                        _analitic()
                      ],
                    )),


              ]),
        ),
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
          stroka5Order(),

          //окно вывода существующих заказов
          Container(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
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

  var coundInList = '0';

  // микс, отображение заказов из базы данных, основа c интернета, все новое, но дизайн старый
  Widget newlist() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('zakaznew').orderBy('time', descending: true).snapshots(),

        builder: (context, snapshot) {
          var clientWidgets = [];
          var idList = [];
          var countindex = [];
          // List clientWidgets = [];
          if (snapshot.hasData) {
            final clients = snapshot.data!.docs.reversed.toList();

            for (var client in clients) {
              //int timeLine1 = client['timeLine'];
              var _userToDo1 = client['number'];
              var _userLogo1 = client['logo'];
              var _userType1 = client['type'];
              var _userNetto1 = client['netto'];
              //var _userId = client['id'];
              var docId = client.id;
              clientWidgets.add(
                  '$_userToDo1, $_userLogo1, $_userType1,  $_userNetto1'); // список для отображения данных
              idList.add(
                  docId); // список для id, потом по этому id происходит удаление.
            }


            for (var count in countindex) {
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
        }
        );
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
                    return dialog(); //_dialog диалоговое окно
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
              //var intValue = Random().nextInt(10);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog(); //_dialog диалоговое окно добавление нового заказа менеджером
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



// 2ое диалоговое окно, информация вывод текста
  Widget _strokaDialogWindowOrder() {
    return Row(
      children: [stroka2()],
    );
  }

  //--- ДИАЛОГОВОЕ ОКНО ДОБАВЛЕНИЕ ЗАКАЗА
  Widget dialog() {
    var _controller;
    return AlertDialog(
      title: const Text('Добавление заказа'),

      //child: ListView(
      content: ListView(
        children: <Widget>[
          TextFormField(
              onChanged: (String value) {
                _userToDo = value;
              },
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                // for below version 2 use this
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                FilteringTextInputFormatter.digitsOnly

              ],
              decoration: InputDecoration(
                  labelText: "Количество бутылей",
                  //hintText: "whatever you want",
                  icon: Icon(Icons.opacity)
              )
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

              var timeNow = DateTime.now();
              var timeNowString = timeres111();


              FirebaseFirestore.instance.collection('zakaznew').add({
                'number': _userToDo,
                'logo': _userLogo,
                'type': _userType,
                'netto': _userNetto,
                'time': timeNow,
                'timeLine': timeNowString,
              });

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
              _userToDo = '';
              _userLogo = '-';
              _userType = '-';
              _userNetto = '-';
            },
            child: const Text('ОТПРАВИТЬ')),
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


  //строка "Заказы в очереди"
   @override
  Widget stroka5Order() {
        return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Text('$orderInLine:',
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
          child: const Text('Данные по выпуску продукции: ',
              style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
      ],
    );
  }

  //строка "Данные по обслуживанию PL-1"
  Widget remontTitle() {
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




  // КНОПКА 'Добавить инф по сервису
  Widget buttonServiceAdd() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 2.0, bottom: 2.0),
      child: Row(
        children: [
          Container(
            //width: double.infinity,
            child: ElevatedButton(
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
                      return dataServiceAdd(); //_dialog диалоговое окно
                    });
              },
              child: const Text(
                'Добавить информацию',
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dataServiceAdd() {
    return AlertDialog(
      backgroundColor: Colors.orange,
      title: const Text('Ремонт и обслуживании'),
      content: TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.medical_services),
          //hintText: 'Какие работы проводились?',
          labelText: 'Добавить информацию',
        ),
        minLines: 1,
        maxLines: 5,
        onChanged: (String value) {
          _userToDo = value;
        },
        //decoration: const InputDecoration(hintText: "Количество"),
        textAlign: TextAlign.center,
      ),

      actions: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10.0, top: 2.0, bottom: 2.0),
          child: ElevatedButton(
              onPressed: () {

                var timeNow = DateTime.now();
                var timeNowString = timeres111();
                final mark = DateTime.timestamp();

                //var operator = '';


                String timestamp;
                DateTime now = DateTime.now();
                String formatDate = DateFormat('Дата: yyyy-MM-dd \nВремя: kk:mm').format(now);
                timestamp = formatDate;

                FirebaseFirestore.instance.collection('/service').add({
                 //'timestamp':DateTime.now,

                  'number': _userToDo,
                  //'timeLine': timeNowString,
                  'time11' : timestamp,
                  'operator' : nameOperator,
                  'time': timeNow,
                });

                //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
                Navigator.of(context).pop();
                _userToDo = '';

              },
              child: const Text('ОТПРАВИТЬ')),
        ),
      ],
    );
  }


  // КНОПКА 'читать инф ПО сервису
  Widget buttonServiceRead() {
    return Container(
      width: double.maxFinite,
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
                    return dataServiceRead(); //_dialog диалоговое окно
                  });
            },
            child: const Text(
              'Все записи',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget dataServiceRead() {
    return AlertDialog(
      backgroundColor: Colors.orange,
      title: const Text('Ремонт и обслуживании'),
      content:
      dataServiceList22(),

      actions: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {

                var timeNow = DateTime.now();
                var timeNowString = timeres111();

                //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
                Navigator.of(context).pop();
                _userToDo = '';

              },
              child: const Text('закрыть')),
        ),
      ],
    );
  }




  //обслуживание машины из базы данных - показывает все записи
  Widget dataServiceList22() {
    return StreamBuilder<QuerySnapshot>(
      //создание списка из базы данных
        stream: FirebaseFirestore.instance.collection("service").orderBy("time").snapshots(),
        builder: (context, snapshot) {
          var clientWidgets = [];
          var idList = [];
          var countindex = [];

          // List clientWidgets = [];
          if (snapshot.hasData) {
            final clients = snapshot.data!.docs.reversed.toList();
            for (var client in clients) {
              String timeLine1 = client['time11'];
              var _userToDo1 = client['number'];
              var _operatorName = client['operator'];
              var time = client['time'];

              var docId = client.id;
              clientWidgets.add(
                  '$timeLine1 \nОператор: $_operatorName\n$_userToDo1 '); // список для отображения данных
              idList.add(docId);
            }
            for (var count in countindex) {
              var _count = count;
            }
          }else{
            return Text('Процесс загрузки...',
                style: TextStyle(fontSize: 20, color: Colors.orange));
          }

          //возвращает вид в виде списка
          return Container(
            alignment: Alignment.bottomLeft,
            //width: double.infinity,
            //height: 200,
            margin: EdgeInsets.only(top: 2, left: 2, right: 2),
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: const BorderRadius.all(Radius.circular(9))),

            child: ListView.builder(
              itemCount: clientWidgets.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.only(top: 5, left: 5, right: 15),
                        child: Text(clientWidgets[index],
                    )),
                    Container(
                      height: 2,
                      color: Colors.orange[600],
                    )
                  ],
                );
              },
            ),
          );
        });
  }
}



