import 'dart:math';


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:untitled111/01_Operator_PL1/01OperButtle/FireBase/clasesGiveDate.dart';
import 'package:untitled111/city_pirogovskiy_details/details_bottel_2lev_part.dart';
import 'package:untitled111/color.dart';
import 'package:untitled111/fireBase/getData.dart';
import 'package:untitled111/nameOperator.dart';


import 'package:untitled111/firebase_options.dart';
import 'package:untitled111/func/funcData.dart';
import 'package:untitled111/style/style_text_Name.dart';
import 'package:untitled111/style/words.dart';
import 'package:untitled111/styleBoxDecoration.dart';
import '../../city_pirogovskiy_details/dimensions.dart';

import 'package:flutter/foundation.dart';

import 'widgets/buttons.dart';
import 'widgets/widgets.dart';



var _userToDo = '';
var _kolichestvo = '';
var _brack = '';




class OperatorButtle extends StatefulWidget {
  const OperatorButtle({super.key});
  @override
  State<OperatorButtle> createState() => _OperatorButtle();
}

class _OperatorButtle extends State<OperatorButtle> {
  //String nameOperator = 'Ивановf И.И.';


  void initFireBase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  void initState() {
    super.initState();
    initFireBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: margin_35_10_10_0,
          padding: padding_5_10_10_0,
          decoration: styleBoxDecorationContainerGrey300,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                returnFirebaseStartSesion(),
                _blockStatePL1(), //PL1 и ее состояние
                operatorZakaz(),
                displayOrderForOperator1(), //заказы в очереди
                displaySmena(), // блок - сделано за смену
                blockService(),

              ],
            ),
          )),
    );
  }


  // 01 блок текущего заказа
  Widget operatorZakaz() {
    return Container(
      padding: padding_15_5_5_0,
      margin: margin_5_5_5_0,
      decoration: styleBoxDecorationContainerGrey400,
      child: Column(
        children: [
          stroka4(),
          GiveOrderForOperator().giveBaseOrderForOperator(),
          //заказ сколько надо сделать
          displaySummaDataOrder(),
          // сделано и брак
          _buttonAddDataOrder(),
          //добавить данные по текущему заказу
          _buttoCloseOfer(),
        ],
      ),
    );
  }

  // 01 блок по обслуживанию машины
  Widget blockService() {
    return Container(
      padding: padding_5_5_5_0,
      margin: margin_5_5_5_0,
      decoration: styleBoxDecorationContainerGrey400,
      child: Column(
        children: [
          MyTextPage111State().remontTitle(),
          buttonServiceAddOper(),
          buttonServiceReadOper(),
        ],
      ),
    );
  }

// Заказы в очереди
  Widget displayOrderForOperator1() {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: padding_5_5_5_0,
      margin: margin_5_5_5_0,
      //decoration: styleBoxDecorationContainerGrey400,
      color: Colors.grey[400],
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: margin_0_10_0_0,
            child: Text('Заказы в очереди:', textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0),
            ),

          ),
          displayOrderForOperator()

        ],
      ),
    );
  }

  //
  Widget displaySmena() {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: padding_5_5_5_0,
      margin: margin_5_5_5_0,
      decoration: styleBoxDecorationContainerGrey400,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: margin_0_10_0_0,
            child: Text('Сделано за смену:', textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0),
            ),

          ),
          WidgetsForOperator().displayDayCount(),
          buttonAddDataSmena(),

        ],
      ),
    );
  }

//кнопка добавить данные по смене
  @override
  Widget buttonAddDataSmena() {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
        ),
      ),
      onPressed: () {

        final docRef = FireBaseVar("SesionStart").doc('UtywjetxVdPDmV0E0TcF');
        docRef.get().then(
              (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            var data11 = data['name'];
            if (nameOperator == data11) {
              setState(() {
                showDialog(
                    context: context,

                    builder: (BuildContext context) {
                      return Text('ghgghghg');
                      _button2_DialogAddDataOrder(); //_dialog диалоговое окно
                    });
              });
            }else{ //ссобщение которое выводится, если закончить смену пытается не тот оператор
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return  massageCloseJob(context);
                  });
            }
            // ...
          },
          onError: (e) => print("Error getting document"),
        );



      },
      child: const Text(
        'Добавить данные по заказу',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

//виджет отображения сделанного за смену
//Widget displayMadeSmena() {
// return
//}



//виджет отображения всего списка заказов, выбор для начала работы над ним
  Widget displayOrderForOperator() {
    return StreamBuilder<QuerySnapshot>(
      //создание списка из базы данных
        stream: FireBaseVar("zakaznew").orderBy('time', descending: true).snapshots(),
        builder: (context, snapshot) {
          var clientWidgets = [];
          var idList = [];
          var countindex = [];
          // List clientWidgets = [];
          if (snapshot.hasData != null) {
            final clients = snapshot.data!.docs.reversed.toList();
            for (var client in clients) {
              var _userToDo1 = client['number'];
              var _userLogo1 = client['logo'];
              var _userType1 = client['type'];
              var _userNetto1 = client['netto'];
              var datePublishet ;
              //var _userId = client['id'];
              var docId = client.id;
              clientWidgets.add(
                  '$_userToDo1 шт, лого: $_userLogo1, тип: $_userType1, вес: $_userNetto1'); // список для отображения данных
              idList.add(docId);
            }
            for (var count in countindex) {
              var _count = count;
            }
          }else{
            return Text('Процесс загрузки...',
                style: TextStyle(fontSize: 20, color: Colors.orange));
          }

          //возвращает вид в виде списка, также удаляет выбранный заказ и перемещает в текущий
          return Container(
            //color: Colors.yellow,
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 100, maxHeight: 200 ),
            //constraints: BoxConstraints(minHeight: 100),
            //height: height200,
            decoration: styleBoxDecorationContainerGrey440,

            child: ListView.builder(
              padding: padding_5_5_5_5,
              itemCount: clientWidgets.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.grey[500],
                  margin: EdgeInsets.only(top: 2, left: 2, right: 2),

                  child: Row(
                    children: [

                          IconButton(
                              icon: const Icon(Icons.safety_check),

                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Начать выполнение заказа'),
                                        //child: ListView(
                                        content: Container(
                                          width: widthDoubleInfinity,
                                          height: height100,
                                          child: ListView(
                                            children: [
                                            ],
                                          ),
                                        ),
                                        // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
                                        actions: [
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      fixedSize: const Size(
                                                          110, 50)
                                                  ),
                                                  onPressed: () {
                                                    //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Нет')),
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      fixedSize: const Size(
                                                          110, 50)
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      FireBaseVar("variablBlocForOrder").doc('wOWxatVZnWr2s1kievXV')
                                                          .update({
                                                        'number': clientWidgets[index]
                                                      });

                                                      FireBaseVar("zakaznew")
                                                          .doc(idList[index])
                                                          .delete();
                                                    });

                                                    //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Да')),
                                            ],
                                          ),
                                        ],
                                      ); //_dialog диалоговое окно
                                    });
                              }),
                          Flexible(child: Text(clientWidgets[index])),

                      //Divider(),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }


//--- ДИАЛОГОВОЕ ОКНО, выполнение заказа
  Widget _confirmStartOrder() {
    return AlertDialog(
      title: const Text('Начать выполнение заказа'),
      //child: ListView(
      content: ListView(
        children: [
        ],
      ),
      // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
      actions: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {

                  });

                  //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
                  Navigator.of(context as BuildContext).pop();
                },
                child: const Text('Да')),

          ],

        ),

      ],
      //--------------------------------------
    );
  }

// 01 фраза Текущий заказ
  Widget stroka4() {
    return Row(
      children: [
        Container(
          padding: padding_0_5_5_0,
          child: Text('Текущий заказ:',
              style: const TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ],
    );
  }

   //02 виджет отображения суммы данных по определенному заказу
  Widget displaySummaDataOrder() {
    return Container(

      child: Column(

        children: [
          StreamBuilder<QuerySnapshot>(
            //создание списка из базы данных
              stream: FireBaseVar('OrderProgress')
                  .snapshots(),
              builder: (context, snapshot) {
                var clientWidgets = [];
                var brackSt = [];
                int intVal2 = 0;
                int brackFinish2 = 0;
                if (snapshot.hasData) {
                  final clients = snapshot.data!.docs.reversed.toList();
                  for (var client in clients) {
                    int intVal1 = 0;
                    int brackFinish = 0;

                    var _userToDo1 = client['number'];
                    intVal1 = int.parse(_userToDo1);
                    intVal2 = intVal2 + intVal1;


                    var _brack2 = client['brack'];
                    brackFinish = int.parse(_brack2);
                    brackFinish2 = brackFinish2 + brackFinish;

                  }
                }

                return Container(
                  alignment: Alignment.topLeft,
                  height: height45,
                  padding: padding_0_5_5_0,

                  child: ListView.builder(
                    padding: paddingZero,
                    itemCount: 1, //clientWidgets.length,
                    itemBuilder: (BuildContext context, int index) {

                      return Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'Сделано: ${intVal2.toString()} шт.'),
                            ),

                            Container(
                              alignment: Alignment.topLeft,
                              child: Text('Брак: ${brackFinish2
                                  .toString()} шт.'),


                            ),
                          ]
                      );
                    },
                  ),

                );
              }),
        ],

      ),
    );
  }

  //01 кнопка закрыть заказ
  Widget _buttoCloseOfer() {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
        ),
      ),
      onPressed: () async {

        var docRef = FireBaseVar('SesionStart').doc('UtywjetxVdPDmV0E0TcF');
            //firebaseFirestore_Collection_SesionStart;
        var collection = FireBaseVar('OrderProgress');
            //firebaseFirestore_Collection_OrderProgress;
        var snapshots = await collection.get();
        docRef.get().then(
                (DocumentSnapshot doc) {
              final data = doc.data() as Map<String, dynamic>;
              var data11 = data['name'];
              if (nameOperator == data11) {
                setState(() {
                  for (var doc in snapshots.docs) {
                    doc.reference.delete();
                  }
                  FireBaseVar('variablBlocForOrder').doc('wOWxatVZnWr2s1kievXV')
                      .update({
                    'number': 'Нет выбранного заказа',
                    'brack': '0'
                  });

                                  });
              }else{ //ссобщение которое выводится, если закончить смену пытается не тот оператор
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return  massageCloseJob(context);
                    });
              }
              // ...
            }
        );

      },


      child: const Text(
        'Закрыть заказ',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  //кнопка добавить данные по заказу
  Widget _buttonAddDataOrder() {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
        ),
      ),
      onPressed: () {

        final docRef = FireBaseVar('/SesionStart').doc('UtywjetxVdPDmV0E0TcF');
        docRef.get().then(
              (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            var data11 = data['name'];
            if (nameOperator == data11) {
              setState(() {
                showDialog(
                    context: context,

                    builder: (BuildContext context) {
                      return _button2_DialogAddDataOrder(); //_dialog диалоговое окно
                    });
              });
            }else{ //ссобщение которое выводится, если закончить смену пытается не тот оператор
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return  massageCloseJob(context);
                  });
            }
            // ...
          },
          onError: (e) => print("Error getting document"),
        );



      },
      child: const Text(
        'Добавить данные по заказу',
        style: TextStyle(color: Colors.black),
      ),
    );
  }


  final buttonNo= new ButtonNo();

  //кнопка2 диалогового окна Добавить данные по заказу
  Widget _button2_DialogAddDataOrder() {
    var _controller;
    _kolichestvo = '0';
    _brack = '0';
    return Container(
      height: 200,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(
                Radius.circular(10.0))),


        title: const Text('Добавить информацию'),
        content: Container(
            height: 150.0, //высота блока

            child: ListView(
              children: [
                TextFormField(
                    onChanged: (String value) {
                      _kolichestvo = value;
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

                TextFormField(
                    onChanged: (String value) {
                      _brack = value;
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
                        labelText: "Количество брака",
                        icon: Icon(Icons.delete_rounded)
                    )
                ),

              ],
            )
        ),
        // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
        actions: [
          Row(
            children: [


              ElevatedButton(
                  onPressed: () {

                    //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
                    Navigator.of(context as BuildContext).pop();
                    _kolichestvo = '0';
                    _brack = '0';
                  },
                  child: const Text('закрыть')
              ),

              ElevatedButton(
                  onPressed: () {

                    String timestamp;
                    DateTime now = DateTime.now();
                    String formatDate = DateFormat('Дата: yyyy-MM-dd \nВремя: kk:mm').format(now);
                    String formatDate1 = DateFormat('yyyy-MM-dd').format(now);
                    timestamp = formatDate;
                    String timestamp1 = formatDate1;

                    //отправка сделано в заказе
                    FireBaseVar('OrderProgress').add({
                      'number': _kolichestvo,
                      'brack': _brack,
                      'time11' : timestamp,
                      'time111' : timestamp1 ,
                      'name' : nameOperator,
                    });

                    //отправка в сделанное за смену
                    FireBaseVar('smenaOperatorov/dayCount/day').add({
                      'number': _kolichestvo,
                      'brack': _brack,
                      'time11' : timestamp,
                      'time111' : timestamp1 ,
                      'name' : nameOperator,
                    });


                    //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
                    Navigator.of(context as BuildContext).pop();
                    _kolichestvo = '0';
                    _brack = '0';
                  },
                  child: const Text('Отправить')
              ),
            ],
          ),

        ],
      ),
    );
  }
  //get nameOperator1 => nameOperator;

  //кнопка начать смену
  Widget _button01() {
    //returnFirebaseStartSesion();

    return Container(
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue[600]!),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 25)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          onPressed: () async {
            setState(() {
              FireBaseVar('SesionStart').doc('UtywjetxVdPDmV0E0TcF')
              //firebaseFirestore_Collection_SesionStart
                  .update({'start': 'false', 'name': '$nameOperator'});
            });

          },
          child: const Text(
            'Начать смену',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  //кнопка закончить смену
  Widget button02() {
    return Column(
      children: [
        Container(
          width: widthDoubleInfinity,
          height: height60,
          child: ElevatedButton (

            style: ButtonStyle(

              backgroundColor: const MaterialStatePropertyAll<Color>(Colors.green),
              textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 25)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: styleBorderRadius9,
                ),
              ),
            ),
            onPressed: () async{
              final docRef =  FireBaseVar('SesionStart').doc('UtywjetxVdPDmV0E0TcF');
              docRef.get().then(
                    (DocumentSnapshot doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  var data11 = data['name'];
                  if (nameOperator == data11) {
                    setState(() {
                      FireBaseVar('SesionStart').doc('UtywjetxVdPDmV0E0TcF')
                          .update({'start': 'true', 'name': '---'});
                    //FireBaseVar("zakaznew").doc(idList[index])        .delete();    });fgfgf vv
                    });
                  }else{ //ссобщение которое выводится, если закончить смену пытается не тот оператор
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return  massageCloseJob(context);
                        });
                  }
                  // ...
                },
                onError: (e) => print("Error getting document"),
              );
            },
            child: const Text(
              'Закончить смену',
              style: textStyleColorBlack,
            ),
          ),
        ),
        nameOperator11(),
        //Text('Оператор: $nameOperator')
      ],
    );
  }


  //возвращает одну из кнопок: начать смену или закончить смену
  Widget returnFirebaseStartSesion() {
    //CollectionReference student = FireBaseVar('sesionStart');
    return FutureBuilder<DocumentSnapshot>(
        future: FireBaseVar('SesionStart').doc('UtywjetxVdPDmV0E0TcF').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;

            String data1 = data['start'];
            var nameFromFirebase = data['name'];

            // var qwerf = ReturnTrue2();
            //var name = returnNameFile();

            if (data1 == 'false') {
              return Visibility(visible: true, child: button02());
            } else {
              return Visibility(visible: true, child: _button01());
            }
          }
          return Visibility(
              visible: false,
              child: button02());
        });
  }

  //строка с именем машины, статусом и кнопкой изменения
  Widget _blockStatePL1() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: padding_5_10_10_0,
              child: const Text('PL-1:',
                  style: textStyleFontSize20_Orange),
            ),
            Container(
              padding: padding_5_5_5_0,
            ),
            GiveDataMashine().giveDataStatus(), //вывод статуса машины
            Container(
              padding: padding_5_5_5_0,
            ),
            _button03(),
          ],
        ));
  }

  //режим машины кнопка
  Widget _button03() {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: styleBorderRadius9,
          ),
        ),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return _dialog1(); //_dialog диалоговое окно
            });

      },
      child: const Text(
        'Изменить',
        style: textStyleColorBlack,
      ),
    );
  }

//--- ДИАЛОГОВОЕ ОКНО, изменение статуса состояния машины
  Widget _dialog1() {
    return AlertDialog(
      title: const Text('Статус'),
      //child: ListView(
      content: ListView(
        children: [
          TextField(
            onChanged: (String value) {
              _userToDo = value;
            },
            decoration: const InputDecoration(hintText: "Статус машины"),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
      actions: [
        ElevatedButton(
            onPressed: () async {
              setState(() {
                FireBaseVar('status').doc('MBCgykpboKR3gKg3YQ3c')
                    .update({'mes1': '$_userToDo'});
              });

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context as BuildContext).pop();
            },
            child: const Text('Отправить')),
      ],
      //--------------------------------------
    );
  }

  blockZakaz() {
    return Container(
      margin: margin_7_1_1_7,
      decoration: styleBoxDecorationContainerGrey400,

      child: Column(
        children: [

          //окно вывода существующих заказов

          Container(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: height100,
              ),
              child: _list2(),
            ),
          ),
        ],
      ),
      // ),
    );
  }

// ОТОБРАЖЕНИЕ СОДЕРЖАНИЯ viewList
  @override
  Widget _list2() {
    return ListView.separated(
      itemCount: todoList1.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 2);
      },
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(todoList1[index]),
          child: SizedBox(
            height: height15,
            child: Card(
              color: colorGrey300,
              child: ListTile(
                title: Text(todoList1[index]),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _list22() {
    return ListView.separated(
      itemCount: todoList1.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 2);
      },
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            key: Key(todoList1[index]),
            child: SizedBox(
              height: height45,

              child: Card(
                color: colorGrey300,
                child: ListTile(
                    title: Text(todoList1[index]),
                    leading: const Icon(Icons.star)),
              ),
            ));
      },
    );
  }


  //----------------------------------------


  // КНОПКА 'Добавить инф по сервису
  Widget buttonServiceAddOper() {
    return Container(
      margin: margin_2_10_0_2,
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
                          borderRadius: styleBorderRadius9,
                          side: const BorderSide(color: Colors.black12)))),
              onPressed: () {
                // ВСПЛЫВАЮЩЕЕ ОКНО ДЛЯ ВНЕСЕНИЯ ДАННЫХ
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dataServiceAddOper(); //_dialog диалоговое окно
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

  Widget dataServiceAddOper() {
    return AlertDialog(
      backgroundColor: colorOrangeStyle,
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
          margin: margin_2_10_0_2,
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

                FireBaseVar('service').add({
                  'number': _userToDo,
                  'time11' : timestamp,
                  'operator' : nameOperator,
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
  Widget buttonServiceReadOper() {
    return Container(
      width: widthDoubleMaxFinite,
      margin: margin_10_10_0_10,
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
                    return dataServiceReadOper(); //_dialog диалоговое окно
                  });
            },
            child: const Text(
              'Все записи',
              style: textStyleColorBlack,
            ),
          )
        ],
      ),
    );
  }

  Widget dataServiceReadOper() {
    return AlertDialog(
      backgroundColor: colorOrangeStyle,
      title: const Text('Ремонт и обслуживании'),
      content:
      dataServiceList22Oper(),

      actions: [
        Container(
          width: widthDoubleInfinity,
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

  //отображение обслуживание машины из базы данных - показывает все записи
  Widget dataServiceList22Oper() {
    return StreamBuilder<QuerySnapshot>(
      //создание списка из базы данных
        stream: FireBaseVar('service').orderBy("time").snapshots(),
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
              //var time11 = client['time11'];

              var docId = client.id;
              clientWidgets.add(
                  '$timeLine1 \n$_userToDo1 \nоператор: $_operatorName'); // список для отображения данных
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
            margin: margin_2_2_2_0,
            decoration: styleBoxDecorationContainerGrey400,

            child: ListView.builder(
              itemCount: clientWidgets.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                        alignment: Alignment.bottomLeft,
                        margin: margin_5_5_5_0,
                        child: Text(clientWidgets[index],
                        )),
                    Container(
                      height: 2,
                      color: colorOrangeStyle600,
                    )
                  ],
                );
              },
            ),
          );
        });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('nameOperator', nameOperator));
  }



}



