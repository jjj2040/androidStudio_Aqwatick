


//02 виджет отображения суммы данных по определенному заказу
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget displaySummaDataOrder1() {
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