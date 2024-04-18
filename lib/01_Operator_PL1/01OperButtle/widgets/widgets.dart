
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled111/01_Operator_PL1/01OperButtle/FireBase/clasesGiveDate.dart';
import 'package:untitled111/01_Operator_PL1/01OperButtle/operatorButtle.dart';
import 'package:untitled111/styleBoxDecoration.dart';


class WidgetsForOperator extends OperatorButtle{


//02 виджет отображения сколько сделано операторм за эту смену
  Widget displayDayCount() {
    return Container(

      child: Column(

        children: [
          StreamBuilder<QuerySnapshot>(
            //создание списка из базы данных
              stream: FireBaseVar('smenaOperatorov/dayCount/day')
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




}





