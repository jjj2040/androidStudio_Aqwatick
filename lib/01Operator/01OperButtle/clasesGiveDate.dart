import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled111/01Operator/01OperButtle/operatorButtle.dart';
import 'package:firebase_database/firebase_database.dart';





// вывод статуса машины
@override
class GiveDataMashine {
  CollectionReference student = FirebaseFirestore.instance.collection('status');

  giveDataStatus() {
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



//вывод числа
class FirstIntOrder {
  CollectionReference student = FirebaseFirestore.instance.collection('variablBlocForOrder');
    firstIntOrder() {
      return FutureBuilder<DocumentSnapshot>(
          future: student.doc('wOWxatVZnWr2s1kievXV').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<
                  String,
                  dynamic>;
              String data1 = data['number'];

              var fffgg =  data1.toString();
              List<String> mylist = fffgg.split(' ');
              int intVal = int.parse(mylist[0]);

              return
                Text('$intVal',
                  style: TextStyle(fontSize: 15, color: Colors.orange));
            }

            return Text('Процесс загрузки...',
                style: TextStyle(fontSize: 20, color: Colors.orange));
          });
    }
  }

//вывод числа сделано
class IntegerOrder {
  CollectionReference student = FirebaseFirestore.instance.collection('OrderProgress');
  integerOrder() {
    return FutureBuilder<DocumentSnapshot>(
        future: student.doc('wOWxatVZnWr2s1kievXV').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<
                String,
                dynamic>;
            String data1 = data['number'];

            var fffgg =  data1.toString();
            List<String> mylist = fffgg.split(' ');
            int intVal = int.parse(mylist[0]);

            return
              Text('$intVal',
                  style: TextStyle(fontSize: 15, color: Colors.orange));
          }

          return Text('Процесс загрузки...',
              style: TextStyle(fontSize: 20, color: Colors.orange));
        });
  }
}




//var ssss45555 = FirstIntOrder().firstIntOrder();
//int intValffff = (int.parse(ssss45555) + 111);

//var fffgg = clientWidgets[0].toString();
//List<String> mylist = fffgg.split(' ');

// перевод String to Int
@override
class StringtoInt {

  stringtoInt(){
    String string1 = '1111';
    int stringFirst = int.tryParse(string1) ?? 0 ;
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
    firstInt1Order2(){

      return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('variablBlocForOrder').doc('wOWxatVZnWr2s1kievXV').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

              int data1 = data['number'] ;
              return Text('$data1',
                  style: TextStyle(fontSize: 15, color: Colors.orange));
            }

            return Text('Загружается', style: TextStyle(fontSize: 20, color: Colors.orange));
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
              stream: FirebaseFirestore.instance.collection(
                  'variablBlocForOrder').snapshots(),
              builder: (context, snapshot) {
                var clientWidgets = [];
                List<String> errorNull = ['1111'];
                //var map11 = ['number', "Tom"];
                if (snapshot.hasData ) {

                  var clients = snapshot.data!.docs.reversed.toList();
                  for (var client in clients) {
                    var _userToDo1 = client['number'] ;
                    clientWidgets.add('$_userToDo1');
                    // список для отображения данных
                  }

                }
               // clientWidgets.add('Процесс загрузки... 1');
               // return Text('Процесс загрузки...', style: TextStyle(fontSize: 20, color: Colors.orange));



                //возвращает вид в виде списка
                return Container(
                  alignment: Alignment.topLeft,
                  height: 35,
                  padding: EdgeInsets.only(top: 0, left: 5, right: 5),

                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {

                      //var fffgg = clientWidgets[0].toString();
                      //List<String> mylist = fffgg.split(' ');
                      //int intVal = int.parse(mylist[0]); //переменная первого числа - количества бут.
                      //double procent = (int.parse(mylist[0])) / 10;

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

              }),
        ],

      ),
    );
  }
}

