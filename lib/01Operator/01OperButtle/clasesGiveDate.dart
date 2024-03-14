import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled111/01Operator/01OperButtle/operatorButtle.dart';



// вывод статуса машины
@override
class GiveDataMashine {
  CollectionReference student = FirebaseFirestore.instance.collection('status');

  giveData() {
    return FutureBuilder<DocumentSnapshot>(
        future: student.doc('MBCgykpboKR3gKg3YQ3c').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            var data1 = data['mes1'];

            return Text('$data1',
                style: TextStyle(fontSize: 15, color: Colors.orange));
          }

          return Text('Процесс загрузки...',
              style: TextStyle(fontSize: 20, color: Colors.orange));
        });
  }
}

outMetod() {
  var outVivid = GiveDataMashine();
  var fddd = outVivid.giveData();
  return fddd;
}

// отображения  у оператора краткого содержания заказа в блоке текущего выполнения заказа
@override
class GiveOrderForOperator {

  giveBaseOrderForOperator() {
    return Container(
      child: Column(

        children: [
          StreamBuilder<QuerySnapshot>(
            //создание списка из базы данных
              stream: FirebaseFirestore.instance.collection(
                  'variablBlocForOrder').snapshots(),
              builder: (context, snapshot) {
                var clientWidgets = [];
                if (snapshot.hasData) {
                  final clients = snapshot.data!.docs.reversed.toList();
                  for (var client in clients) {
                    var _userToDo1 = client['number'];
                    clientWidgets.add('$_userToDo1');
                    // список для отображения данных
                  }
                }


                var fffgg = clientWidgets[0].toString();
                List<String> mylist = fffgg.split(' ');
                int intVal = int.parse(mylist[0]);
                double procent = (int.parse(mylist[0])) / 10;

                //int asdf = mylist[0];
                //возвращает вид в виде списка
                return Container(
                  alignment: Alignment.topLeft,
                  height: 80,
                  padding: EdgeInsets.only(top: 0, left: 5, right: 5),

                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(clientWidgets[index],
                                style: TextStyle(fontStyle: FontStyle.italic)),

                          ),
                          Container(
                            height: 1,
                            color: Colors.grey[600],
                          ),

                          Container(
                            alignment: Alignment.topLeft,
                            child: Text('Сделано111: ${intVal
                                .toString()} шт., ($procent%)'),
                          ),

                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Брак222 ${intVal.toString()} шт., $procent%'),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Осталось сделать: ${intVal.toString()} шт.'),
                          ),

                        ],
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

outMatodBaseOrderForOperator() {
  var outOrderForOperator = GiveOrderForOperator();
  var forOperator = outOrderForOperator.giveBaseOrderForOperator();
  return forOperator;
}


