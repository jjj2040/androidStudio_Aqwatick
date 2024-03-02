import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled111/city_pirogovskiy_details/newClass.dart';
import 'package:untitled111/firebase_options.dart';
import '../../city_pirogovskiy_details/dimensions.dart';

import 'package:flutter/foundation.dart';

var _userToDo = '';


class operatorButtle extends StatefulWidget {
  const operatorButtle({super.key});
  @override
  State<operatorButtle> createState() => _operatorButtle();
}

class _operatorButtle extends State<operatorButtle> {

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
          margin: const EdgeInsets.only(top: 35, left: 10, right: 10),
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(9))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              returnFirebaseStartSesion(),
              _text2(), //PL1 и ее состояние
              _operatorZakaz(), // блок текущего заказа
              blockZakaz(), // блок списка заказов
              //read(),
            ],
          )),
    );
  }



  Widget _operatorFutureZakaz() {
    return Container();
  }

  Widget _operatorZakaz() {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(9))),
      child: Column(
        children: [
          stroka4(),
          _stroka3(),
          _stroka31(),
          _button04(),
          Container(
            child: Text(vRabote1,
                style: const TextStyle(fontSize: 13, color: Colors.black)),
          ),
          Container(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                //minHeight: 50.0,
                maxHeight: 100.0,
              ),
              // child: todoList1(),
            ),
          ),
        ],
      ),
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

            var data1 = data['mes1'];
            return Text('$data1',
                style: TextStyle(fontSize: 15, color: Colors.orange));
          }

          return Text('', style: TextStyle(fontSize: 20, color: Colors.orange));
        });
  }

  Widget read3() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('01').snapshots(),
        builder: (context, snapshot) {
          List<Row> clientWidgets = [];
          if (snapshot.hasData) {
            final clients = snapshot.data!.docs.reversed.toList();
            for (var client in clients) {
              final clientWidget = Row(
                children: [
                  Text(client['mes1']),
                ],
              );
              clientWidgets.add(clientWidget);
            }
          }

          return Expanded(
            child: ListView(
              children: clientWidgets,
            ),
          );
        });
  }

  Widget stroka4() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          child: Text(vRabote1,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ],
    );
  }

  Widget _stroka3() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          child: const Text('готово: 270 шт. (50%)',
              style: TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ],
    );
  }

  Widget _stroka31() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          child: const Text('брак: 27 шт. (12%)',
              style: TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ],
    );
  }

  //возвращает одну из кнопок: начать смену или закончить смену
  Widget returnFirebaseStartSesion() {
    CollectionReference student =
        FirebaseFirestore.instance.collection('SesionStart');
    return FutureBuilder<DocumentSnapshot>(
        future: student.doc('UtywjetxVdPDmV0E0TcF').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            String data1 = data['start'];
            // var qwerf = ReturnTrue2();
            //var name = returnNameFile();

            if (data1 == 'true') {
              return Visibility(visible: true, child: _button01());
            } else {
              return Visibility(visible: true, child: _button02());
            }
          }
          return Visibility(
              visible: false,
              child: _button02());
        });
  }

  //кнопка начать смену
  Widget _button01() {
    //returnFirebaseStartSesion();
    return Container(
        child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue[600]!),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
        ),
      ),
      onPressed: () async {
        setState(() {
          FirebaseFirestore.instance
              .collection('/SesionStart')
              .doc('UtywjetxVdPDmV0E0TcF')
              .update({'start': 'false'});
        });
      },
        child: const Text(
        'Начать смену',
        style: TextStyle(color: Colors.white),
      ),
    ));
  }

  //кнопка закончить смену
  Widget _button02() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll<Color>(Colors.green),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
        ),
      ),
      onPressed: () async {
        setState(() {
          FirebaseFirestore.instance
              .collection('/SesionStart')
              .doc('UtywjetxVdPDmV0E0TcF')
              .update({'start': 'true'});
        });
      },
      child: const Text(
        'Закончить смену',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  //кнопка закрыть заказ
  Widget _button04() {
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
        //Navigator.push(context, PageTransition(
        //    type: PageTransitionType.fade, child: MyTextPage111())
        // );
        // Делаем что-нибудь, когда кнопка нажата.
      },
      child: const Text(
        'Закрыть заказ',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  //строка с именем машины, статусом и кнопкой изменения
  Widget _text2() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: const Text('PL-1:',
                  style: TextStyle(fontSize: 20, color: Colors.orange)),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
            ),
            read(), //вывод статуса машины
            Container(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
            ),
            _button03(),
          ],
        ));
  }

  //режим машины
  Widget _button03() {
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
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return _dialog1(); //_dialog диалоговое окно
            });
        //Navigator.push(context, PageTransition(
        //    type: PageTransitionType.fade, child: MyTextPage111())
        // );
        // Делаем что-нибудь, когда кнопка нажата.
      },
      child: const Text(
        'Изменить режим машины',
        style: TextStyle(color: Colors.black),
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
                FirebaseFirestore.instance
                    .collection('/status')
                    .doc('MBCgykpboKR3gKg3YQ3c')
                    .update({'mes1': '$_userToDo'});
              });

              //FirebaseFirestore.instance.collection('/status').doc('MBCgykpboKR3gKg3YQ3c').add({'mes1': '$_userToDo'});

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
            },
            child: const Text('Отправить2')),
      ],
      //--------------------------------------
    );
  }

  blockZakaz() {
    return Container(
      margin:
          const EdgeInsets.only(left: 1.0, right: 1.0, top: 7.0, bottom: 7.0),
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(9))),

      child: Column(
        children: [
          //_stroka5Order(),

          //окно вывода существующих заказов

          Container(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                //minHeight: 50.0,
                maxHeight: 100.0,
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
        );
      },
    );
  }

  Widget _list22() {
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
                    leading: const Icon(Icons.star)),
              ),

              //onDismissed:(direction){
              //setState((){
              //  countOrder --;
              //  todoList1.removeAt(index);
              // });
              //},
            ));
      },
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
}
