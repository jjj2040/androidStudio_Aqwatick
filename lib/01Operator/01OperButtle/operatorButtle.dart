

//import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:untitled111/bottomnavbar.dart';
//import 'package:untitled111/password.dart';
//import 'package:page_transition/page_transition.dart';
//private var rrr = '';

import '../../city_pirogovskiy_details/dimensions.dart';


var rrr = '';
var _userToDo = '';

//void main() {
//  runApp(YourClassName());
//}


class operatorButtle extends StatefulWidget {
  const operatorButtle({super.key});

  @override
  State<operatorButtle> createState() => _operatorButtle();
}

class _operatorButtle extends State<operatorButtle> {

 // final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
 // final _controller = TextEditingController();


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

/*
 Widget _dbase(){
  Image.asset('assets/codelab.png'),
  const SizedBox(height: 8),
  const IconAndDetail(Icons.calendar_today, 'October 30'),
  const IconAndDetail(Icons.location_city, 'San Francisco'),
  Consumer<ApplicationState>(
  builder: (context, appState, _) => AuthFunc(
  loggedIn: appState.loggedIn,
  signOut: () {
  FirebaseAuth.instance.signOut();
  }),
  ),
  const Divider(
  height: 8,
  thickness: 1,
  indent: 8,
  endIndent: 8,
  color: Colors.grey,
  ),
  const Header("What we'll be doing"),
  const Paragraph(
  'Join us for a day full of Firebase Workshops and Pizza!',
  ),
  // Modify from here...
  Consumer<ApplicationState>(
  builder: (context, appState, _) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  if (appState.loggedIn) ...[
  const Header('Discussion'),
  GuestBook(
  addMessage: (message) =>
  appState.addMessageToGuestBook(message),
  ),
  ],
  ],
  ),
  ),
   )
  // ...to here.

}

 */





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

/*
  Widget _text1() {
    return
      Container(
        //padding: EdgeInsets.only(top: 0, left: 5, right: 5),
        // margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Row(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Container(
                //padding: EdgeInsets.only(top: 0, left: 5, right: 5),
                //margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Expanded(
                    child: Text(
                        'Последнее добавление: 128 шт., брак - 15 шт, Время: 15:24, Дата: 21.03.2024',
                        style: TextStyle(
                          fontSize: 13, color: Colors.black,),
                        textDirection: TextDirection.ltr)
                ),
              )
            ]


        ),
      );
  }

 */
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
                child: const Text('в работе',
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
      title: const Text('Выпуск продукции'),
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
            onPressed: () {
              setState(() {
                if (_userToDo != '') {
                  todoList1.add(
                      '- $_userToDo');
                } else {

                }
              }
              );

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
            },
            child: const Text('Отправить')),
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







