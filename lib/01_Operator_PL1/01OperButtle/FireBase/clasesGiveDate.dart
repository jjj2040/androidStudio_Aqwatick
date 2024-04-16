import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled111/nameOperator.dart';
import 'package:untitled111/styleBoxDecoration.dart';

var FireBaseVar = FirebaseFirestore.instance.collection;


// обнуление, что сделано за смену
Future<void> getNullForSmena1() async {
  return  FireBaseVar("/smenaOperatorov/dayCount/day").where("name", isEqualTo: nameOperator).get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var doc in querySnapshot.docs) {
        doc.reference.delete();
      }
    },
    onError: (e) => print("Ошибка"),
  );
}

// запись всей информации что сделано за смену (общее количество)
Future<void> getAllCountsForSmena() async {
  return  FireBaseVar("/smenaOperatorov/dayCount/day").where("name", isEqualTo: nameOperator).get().then(
            (querySnapshot) {
          print("Successfully completed");
          var rrrr = '' ;
          var myInt2 = 0 ;

          for (var docSnapshot in querySnapshot.docs) {

            rrrr = docSnapshot['number'];
            int myInt = int.parse(rrrr as String);
            myInt2 = myInt2 + myInt;
            //print('${docSnapshot.id} => ${docSnapshot.data()}');
          }

          FireBaseVar('/smenaOperatorov/allCount/all').add({
            'number': myInt2,
            'brack': 'fgfgf',

          });
        },
        onError: (e) => print("Error completing: $e"),
      );



/*
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

              var nameOperator = client['name'];

            }

            DateTime now = DateTime.now();
            String formatDate = DateFormat('Дата: yyyy-MM-dd \nВремя: kk:mm').format(now);

            FireBaseVar('/smenaOperatorov/allCount/all').add({
              'number': 'intVal2',
              'brack': brackFinish2,
              'time11' : nameOperator,
              'time111' : now ,
              'name' : nameOperator,
            });


          }


          return Container(


          );
        }
        );

 */
}





//получение данных о всех сервисах машины
Future<void> getServiceMashine() async {
  var clientWidgets = [];
    FireBaseVar("service").get().then(
(querySnapshot) {
print("Successfully completed");
for (var docSnapshot in querySnapshot.docs) {
  String timeLine1 = docSnapshot['time11'];
  var _userToDo1 = docSnapshot['number'];
  var _operatorName = docSnapshot['operator'];
  clientWidgets.add(
      '$timeLine1 \n$_userToDo1 \nоператор: $_operatorName');

//print('${docSnapshot.id} => ${docSnapshot.data()}');
}
return clientWidgets;
},
onError: (e) => print("Error completing: $e"),
);
}



// вывод статуса машины
@override
class GiveDataMashine {
  giveDataStatus() {
    return FutureBuilder<DocumentSnapshot>(
        future: FireBaseVar('status').doc('MBCgykpboKR3gKg3YQ3c').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            var data1 = data['mes1'];

            return Text('$data1',
                style: TextStyle(fontSize: 15, color: Colors.orange));
          }

          return Text('Процесс загрузки...',
              style: TextStyle(fontSize: 20, color: Colors.orange));
        });
  }
}

//вывод числа
class FirstIntOrder {
  firstIntOrder() {
    return FutureBuilder<DocumentSnapshot>(
        future: FireBaseVar('variablBlocForOrder')
            .doc('wOWxatVZnWr2s1kievXV')
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            String data1 = data['number'];

            var fffgg = data1.toString();
            List<String> mylist = fffgg.split(' ');
            int intVal = int.parse(mylist[0]);

            return Text('$intVal',
                style: TextStyle(fontSize: 15, color: Colors.orange));
          }

          return Text('Процесс загрузки...',
              style: TextStyle(fontSize: 20, color: Colors.orange));
        });
  }
}

//вывод числа сделано
class IntegerOrder {
  integerOrder() {
    return FutureBuilder<DocumentSnapshot>(
        future: FireBaseVar('OrderProgress').doc('wOWxatVZnWr2s1kievXV').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            String data1 = data['number'];

            var fffgg = data1.toString();
            List<String> mylist = fffgg.split(' ');
            int intVal = int.parse(mylist[0]);

            return Text('$intVal',
                style: TextStyle(fontSize: 15, color: Colors.orange));
          }

          return Text('Процесс загрузки...',
              style: TextStyle(fontSize: 20, color: Colors.orange));
        });
  }
}

// перевод String to Int
@override
class StringtoInt {
  stringtoInt() {
    String string1 = '1111';
    int stringFirst = int.tryParse(string1) ?? 0;
    //String ffff = (stringFirst).toString();
    return stringFirst;
  }
}

//@override
// class FirstInt1Order extends operatorButtle{
// final docRef  = FirebaseFirestore.instance.collection("intS").doc("cj0X35xp3YRmBDiKWLD6").snapshots();
//   firstInt1Order(){

@override
class FirstInt1Order2 {
  firstInt1Order2() {
    return FutureBuilder<DocumentSnapshot>(
        future: FireBaseVar('variablBlocForOrder')
            .doc('wOWxatVZnWr2s1kievXV')
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            int data1 = data['number'];
            return Text('$data1',
                style: TextStyle(fontSize: 15, color: Colors.orange));
          }

          return Text('Загружается',
              style: TextStyle(fontSize: 20, color: Colors.orange));
        });
  }
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
              stream: FireBaseVar('variablBlocForOrder').snapshots(),
              builder: (context, snapshot) {
                var clientWidgets = [];
                List<String> errorNull = ['1111'];
                //var map11 = ['number', "Tom"];
                if (snapshot.hasData != null) {
                  var clients = snapshot.data!.docs.reversed.toList();
                  for (var client in clients) {
                    var _userToDo1 = client['number'];
                    clientWidgets.add('$_userToDo1');
                    // список для отображения данных
                  }
                  return ActualOrderForOperator(clientWidgets);
                } else {
                  return Text('Идет загрузка...');
                }
              }),
        ],
      ),
    );
  }
}

Widget ActualOrderForOperator(clientWidgets) {
  //возвращает вид в виде списка
  return Container(
    alignment: Alignment.topLeft,
    height: 35,
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
          ],
        );
      },
    ),
  );
}
