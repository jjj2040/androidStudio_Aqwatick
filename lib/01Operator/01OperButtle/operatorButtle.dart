

//import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:untitled111/bottomnavbar.dart';
import 'package:untitled111/password.dart';
import 'package:page_transition/page_transition.dart';
//private var rrr = '';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled111/firebase_options.dart';
import '../../city_pirogovskiy_details/dimensions.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';


var rrr = '';
var _userToDo = '';
var user = '1111qwert111';




//void main() {
//  runApp(YourClassName());
//}


class operatorButtle extends StatefulWidget {
  const operatorButtle({super.key});
  @override
  State<operatorButtle> createState() => _operatorButtle();

}

class _operatorButtle extends State<operatorButtle> {

  /*
  void initFireBase() async {
    //Initializing Database when starting the application.
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    //runApp(App());
  }
    */


  void initFireBase()async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }




 // FirebaseFirestore.instance.collection('/01').doc('MBCgykpboKR3gKg3YQ3c').update({'mes1': '$_userToDo'});

  // переменные для изменения данных
//  final auth = FirebaseAuth.instance;
//  final editController = TextEditingController();
 // final fireStore = FirebaseFirestore.instance.collection('/01/qq/33').snapshots();

 // final ref = FirebaseFirestore.instance.collection('/01/qq/33');
  //final ref1 = FirebaseFirestore.instance.collection('/01/qq/33');


  @override
  void initState(){
    super.initState();
    initFireBase();
  }

 // final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
 // final _controller = TextEditingController();
   var qwe = 'llk';
  //FirebaseFirestore.instance.collection('/01').doc('MBCgykpboKR3gKg3YQ3c').get();







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Вернуться"),
      //backgroundColor: Colors.grey[500],
      //  automaticallyImplyLeading: false,
      // ),

      body: Container(
          margin: const EdgeInsets.only(top: 35, left: 10, right: 10),
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(9))),

          child: Column(
            //padding: EdgeInsets.only(top:5, left:5, right:5),
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              _button01(), // начать смену
              _button02(), //закончить смену

              _text2(), //PL1 и ее состояние

              // блок текущего заказа
              _operatorZakaz(),

              // блок списка заказов
              //_operatorFutureZakaz(),

              blockZakaz(),



            ],

          )

      ),
    );
  }


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
              child: ListTile(title: Text(todoList1[index]),),
            ),


          ),


        );
      },
    );
  }

  Widget _operatorFutureZakaz() {
    return Container(

    );
  }

  Widget _operatorZakaz() {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(9))),
      child: Column(
        children: [stroka4(),
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
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            child: const Text('готово: 270 шт. (50%)',
                style: TextStyle(
                    fontSize: 15, color: Colors.black)),
          ),
        ],
      );
  }

  Widget _stroka31() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            child: const Text('брак: 27 шт. (12%)',
                style: TextStyle(
                    fontSize: 15, color: Colors.black)),
          ),
        ],
      );
  }

  Widget _button01() {
    return ElevatedButton(

      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[300]!),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),


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
      child: const Text('Начать смену',
        style: TextStyle(
            color: Colors.black
        ),
      ),

    );
  }

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
      onPressed: () {
        //Navigator.push(context, PageTransition(
        //    type: PageTransitionType.fade, child: MyTextPage111())
        // );
        // Делаем что-нибудь, когда кнопка нажата.
      },
      child: const Text('Закончить смену',
        style: TextStyle(
            color: Colors.black
        ),),);
  }

  Widget _button04() {
    return ElevatedButton(
      style: ButtonStyle(

        textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 15)),
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
      child: const Text('Закрыть заказ',
        style: TextStyle(
            color: Colors.black
        ),),);
  }


  Widget _text2() {

    return
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: const Text('PL-1:',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                //child:
                /*StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('/01/qq/33').snapshots(),
                  builder: (context, snapshot){
                    final clientWidgets = '';
                    //List<Row> clientWidgets = [];

                    return Expanded(
                     child: Text(
                         clientWidgets,
                      )

                    );


                  },
                )*/
                child:  Text(qwe,  //'в работе'

                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Image.network(
                    'https://s1.iconbird.com/ico/0612/vistabasesoftwareicons/w256h2561339252506CircleGreen.png',
                    width: 15,
                    height: 15,
                    fit: BoxFit.fill
                ),

              ),
              _button03(),


            ],
          )
      );
  }


  Widget _button03() {
    return ElevatedButton(
      style: ButtonStyle(

        textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 15)),
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
      child: const Text('Изменить статус1',
        style: TextStyle(
            color: Colors.black
        ),),);
  }

//--- ДИАЛОГОВОЕ ОКНО, ПОДРОБНО ПРО ВЫПУСК ПРОДУКЦИИ
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
            decoration: const InputDecoration(hintText: "Количество"),
            textAlign: TextAlign.center,
          ),
        ],


      ),
      // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
      actions: [
        ElevatedButton(
            onPressed: () async {
              //внесение данных
              //FirebaseFirestore.instance.collection('/01').add({'mes1': _userToDo});

              //изменение данных
              FirebaseFirestore.instance.collection('/01').doc('MBCgykpboKR3gKg3YQ3c').update({'mes1': '$_userToDo'});

             // var qwe = await FirebaseFirestore.instance.collection('/01/qq/33').get('T2896v8O1R1bCEw8BBmq' as GetOptions?);
      /*

*/
              //Future update() async{
               // final userCollection = FirebaseFirestore.instance.collection('/01/qq/33');
              //  final docRef = userCollection.doc('Rqsf7xk1vJmTgz0EU7Be');

              //  await docRef.update({
              //    'mes1': 'Исправление'
             //   });

            //  }




              //nFirebaseFirestore.instance.collectio('/01/qq/33').update[
                //({'mes1': _userToDo});

              //FirebaseFirestore.instance.collection('/01/qq/33').add({'mes1': _userToDo});

;
              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
            },
            child: const Text('Отправить1')),
      ],
      //--------------------------------------
    );
  }

  blockZakaz() {
    return Container(
      margin: const EdgeInsets.only(
          left: 1.0, right: 1.0, top: 7.0, bottom: 7.0),
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


          // КНОПКА ДОБАВЛЕНИЯ НОВОГО ЗАКАЗА
          //_buttonNewOrder(),


        ],
      ),
      // ),
    );
  }


// ОТОБРАЖЕНИЕ СОДЕРЖАНИЯ viewList

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
                    title: Text(todoList1[index]), leading: const Icon(Icons.star)
                ),


              ),

              //onDismissed:(direction){
              //setState((){
              //  countOrder --;
              //  todoList1.removeAt(index);
              // });
              //},

            )
        );
      },
    );
  }

  Widget _itogSmeny() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

            child: const Text('Итог смены:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, color: Colors.red,)),
          ),


        ],
      );
  }
}









