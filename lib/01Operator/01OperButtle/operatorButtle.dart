

//import 'dart:ffi';

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
var rrr3 = '';
var rrr13242 = '';
var uuuuu3242 = '';

class operatorButtle extends StatelessWidget {
  const operatorButtle({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Вернуться"),
      //backgroundColor: Colors.grey[500],
      //  automaticallyImplyLeading: false,
      // ),

      body: Container(
          margin: EdgeInsets.only(top: 35, left: 10, right: 10),
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(9))),

          child: Column(
            //padding: EdgeInsets.only(top:5, left:5, right:5),
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              _button01(),
              _button02(),

              _text2(),

              Container(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                margin: EdgeInsets.only(top: 15, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Column(
                  children: [stroka4(),
                    _stroka3(),
                    _stroka31(),
                    _button04(),
                    Container(
                      child: Text(vRabote1,
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ),
                    Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          //minHeight: 50.0,
                          maxHeight: 100.0,

                        ),
                       // child: todoList1(),


                      ),
                    ),
                  ],
                ),
              )

            ],

          )

      ),
    );
  }

  Widget stroka4() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(top: 0, left: 5, right: 5),
          child: Text(vRabote1,
              style: TextStyle(fontSize: 15, color: Colors.black)),
        ),

      ],
    );
  }

  Widget _stroka3() {
    return
      Row(
        children: [

          Container(
            padding: EdgeInsets.only(top: 0, left: 5, right: 5),
            child: Text('готово: 270 шт. (50%)',
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
            padding: EdgeInsets.only(top: 0, left: 5, right: 5),
            child: Text('брак: 27 шт. (12%)',
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
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),


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
      child: Text('Начать смену',
        style: TextStyle(
            color: Colors.black
        ),
      ),

    );
  }

  Widget _button02() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
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
      child: Text('Закончить смену',
        style: TextStyle(
            color: Colors.black
        ),),);
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
        //Navigator.push(context, PageTransition(
        //    type: PageTransitionType.fade, child: MyTextPage111())
        // );
        // Делаем что-нибудь, когда кнопка нажата.
      },
      child: Text('Изменить статус',
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
      child: Text('Закрыть заказ',
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
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text('PL-1:',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text('в работе',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
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

}

// ОТОБРАЖЕНИЕ СОДЕРЖАНИЯ viewList
/*
Widget _list2() {
  return ListView.separated(
    itemCount: todoList1.length,
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: height2);
    },
    itemBuilder: (BuildContext context, int index) {
      return Dismissible(
        key: Key(todoList1[index]),
        child: Container(
          height: 45,

          child: Card(
            color: Colors.grey[300],
            child: ListTile(title: Text(todoList1[index]),),
          ),


        ),

        onDismissed:(direction){
          //setState((){
          //  countOrder --;
          //  todoList1.removeAt(index);
         // });
        },

      );
    },
  );
}

 */





