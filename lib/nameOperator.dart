import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String nameOperator = 'Иванов И.И.';

Widget nameOperator11(){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
    margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
    child: Text('На смене оператор: $nameOperator',
      textAlign: TextAlign.left,
    style: TextStyle(fontSize: 15, color: Colors.black),
    ),
  )
  ;
}

//сообщение AlertDialog для оператора, если пытается закрыть не тот, кто открыл
Widget massageCloseJob(context){
  return AlertDialog(
    title: const Text('Сообщение'),

    //child: ListView(
    content: Container(
      child: Text('Производить действие может только тот оператор, который открыл смену.'),
    ),


    // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
    actions: [
      ElevatedButton(
          onPressed: () async {           

            //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
            Navigator.of(context).pop();
          },
          child: const Text('Закрыть')),
    ],
    //--------------------------------------
  );
}



Widget jobNow(){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
    margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
    child: Text('В работе заказ:',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15, color: Colors.black),
    ),
  )
  ;
}

//фраза В работе заказ:
Widget orderNow(){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
    margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
    child: Text('В работе заказ:',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15, color: Colors.black),
    ),
  )
  ;
}

Widget displaySummaDataOrder11() {
  return Container(

    child: Column(

      children: [
        StreamBuilder<QuerySnapshot>(
          //создание списка из базы данных
            stream: FirebaseFirestore.instance.collection('OrderProgress')
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
              //FirstIntOrder intwert = FirstIntOrder();
              // intwert2 = int.parse(intwert.firstIntOrder());

              //int intVal = int.parse(mylist[0]); //переменная первого числа - количества бут.



              return Container(
                alignment: Alignment.topLeft,
                height: 45,
                padding: EdgeInsets.only(top: 0, left: 5, right: 5),

                child: ListView.builder(
                  padding: EdgeInsets.zero,
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

                            /*('Брак: ${brackFinish2
                                    .toString()}, (${(intVal2 / intVal2 * 100)
                                    .truncate()
                                    .toString()}%)')

                                 */
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

//чтение данных из FireBase, статус машины
Widget readStatus() {
  //CollectionReference student =
  //FirebaseFirestore.instance.collection('status');
  return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('status').doc('MBCgykpboKR3gKg3YQ3c').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          //-   ??{'mes1': "Tom1111"}) - эта часть возвращается если получает null.
          // До этого было- snapshot.data!.data() as Map<String, dynamic>;
          var data1 = data['mes1'];

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Text('PL-1: $data1',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17, color: Colors.blueAccent,
                )),
          );
        }

        return Text('Процесс загрузки...', style: TextStyle(fontSize: 20, color: Colors.orange));
      });
}

