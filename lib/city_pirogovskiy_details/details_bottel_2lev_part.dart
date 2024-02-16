import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'dimensions.dart';

void main() {
  runApp(const MyApp());
}

int _aa = todoList1.length;
int countOrder = todoList1.length;

String _userToDo = '';
String _userLogo = '';
String _userType = '';
String _userNetto = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: MyTextPage()
    );
  }
}

class MyTextPage111 extends StatefulWidget {
  const MyTextPage111({super.key});

  @override
  State<MyTextPage111> createState() => _MyTextPage111State();


}

class _MyTextPage111State extends State<MyTextPage111> {
  @override

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
  
  initState() {

    initFirebase();

    super.initState();
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Вернуться"),
        backgroundColor: Colors.grey[500],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),

        child: SingleChildScrollView(
          child: Column(
              //padding: EdgeInsets.only(top:5, left:5, right:5),
              //mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
          
              // ЗАГОЛОВОК ЦЕХА
              children: [
                const Text(
                  'Пироговский, цех бутыли',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    //decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
          
                //блок  с названием машины и ПОЛНЫМ СОДЕРЖАНИЕМ ЗАКАЗОВ
          
                Container(
                    //margin: const EdgeInsets.only(
                     //   left: 1.0, right: 1.0, top: 5.0, bottom: 5.0),
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: const BorderRadius.all(Radius.circular(9))),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.max,
                      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
          
                        //строка с названием машины
                        _stroka1(),



                        // строка с кратким содержанием заказа


                        //фраза 'Данные по выпуску продукции'
                        Container(
                          margin: const EdgeInsets.only(
                              left: 1.0, right: 1.0, top: 7.0, bottom: 7.0),
                          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: const BorderRadius.all(Radius.circular(9))),
                            child: Column(
                              children: [

                                _stroka6(),
                                _stroka4Oper(),
                                stroka2(),
                                _stroka8(),
                                _stroka3(), // процент готовой продукции
          
                                _buttonOrder2()
                              ],
                          ),
                        ),


                        // Блок добавления и вывода заказов
                        blockZakaz(),


                        //блок по записи ремонтных работ с машиной
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: const BorderRadius.all(Radius.circular(9))),
                          child: Column(
                            children: [
                              _remontTitle(),
                              _remontBriefly(),
                              _buttonOrder2()
          
                            ],
                          ),
                        ),
          
          
                        _analitic()
          
          
          
          
                      ],
                    )),
          
                //ПРОБНЫЙ ПУСТОЙ БЛОК ДЛЯ ВЫВОДА ЛИСТ ВЬЮ
              ]),
        ),
      ),
    );
  }

  final int _qqq = 0;


  Widget _list3() {
    return Scrollbar(
      child: ListView(
        children: [
          // Text(todoList1[_count1()]),
          Text(todoList1.first),
          Text(todoList1[0]),
          Text(todoList1[1]),
          Text(todoList1[2]),
          Text(todoList1.last),
          Text(todoList1.last),
          Text(todoList1[_aa - 3]),
        ],
      ),
    );
  }

// Блок добавления и вывода заказов
  Widget blockZakaz() {
    return Container(
      margin: const EdgeInsets.only(
          left: 1.0, right: 1.0, top: 7.0, bottom: 7.0),
      decoration: BoxDecoration(

          color: Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(9))),


      child: Column(


        children: [

          _stroka5Order(),

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
          _buttonNewOrder(),


        ],
      ),
      // ),
    );
  }

  // ОТОБРАЖЕНИЕ СОДЕРЖАНИЯ viewList
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

            onDismissed:(direction){
          setState((){
            countOrder --;
            todoList1.removeAt(index);
          });
        },

        );
      },
    );
  }
/*
  Widget _displayList() {
    return Container(
      //СТРОКА С LISTVIEW
      // /*
      child: ListView.builder(
          //itemCount: 2, //todoList.length,
          itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: todoList1[index],
          child: ListTile(
            title: Text(todoList1[index]),
          ),
        );
      }),

      //        */
    );
  }

 */

  // КНОПКА 'ПОДРОБНО' ПО ВЫПУСКУ ПРОДУКЦИИ
  Widget _buttonOrder2() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                textStyle:
                MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(color: Colors.black12)))),
            onPressed: () {
              // ВСПЛЫВАЮЩЕЕ ОКНО ДЛЯ ВНЕСЕНИЯ ДАННЫХ
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _dialog1(); //_dialog диалоговое окно
                  });
            },
            child: const Text(
              'Подробно',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  // КНОПКА 'Аналитика' ПО ВЫПУСКУ ПРОДУКЦИИ
  Widget _analitic() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                textStyle:
                MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(color: Colors.black12)))),
            onPressed: () {
              // ВСПЛЫВАЮЩЕЕ ОКНО ДЛЯ ВНЕСЕНИЯ ДАННЫХ
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _analiticDetails(); //_dialog диалоговое окно
                  });
            },
            child: const Text(
              'Аналитика',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  // КНОПКА ДОБАВЛЕНИЕ НОВОГО ЗАКАЗА
  Widget _buttonNewOrder() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(color: Colors.black12)))),
            onPressed: () {
              // ВСПЛЫВАЮЩЕЕ ОКНО ДЛЯ ВНЕСЕНИЯ ДАННЫХ
              showDialog(
                  context: context,
                  builder: (BuildContext context) {

                    return _dialog(); //_dialog диалоговое окно
                  });
            },
            child: const Text(
              'Добавить заказ',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  //--- ДИАЛОГОВОЕ ОКНО, ПОДРОБНО ПРО ВЫПУСК ПРОДУКЦИИ
  Widget _dialog1() {
    return AlertDialog(
      title: const Text('Выпуск продукции'),
      //child: ListView(
      content: ListView(
        children: [


          _itogSmeny(),
          _addOrderTime3(),
          _stroka4Oper(),
          _addOrder2(),
          _strokaDialogWindowOrder(),
          _stroka3(),
          _stroka__(),
          //--------
          _addOrderTime3(),
          _stroka4Oper(),
          _addOrder2(),
          _strokaDialogWindowOrder(),
          _stroka3(),
          _stroka__(),
          //---------
          _addOrderTime1(),
          _stroka4Oper(),
          _addOrder2(),
          _strokaDialogWindowOrder(),
          _stroka3(),
          _stroka__(),
          //---------

          _addOrder(),
          _stroka4Oper(),
          _addOrder2(),
          _strokaDialogWindowOrder(),
          _stroka3(),
          _stroka__(),
          //---------






        ],
      ),
      // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
      actions: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (_userToDo != '') {
                  todoList1.add(
                      '- $_userToDo, $_userLogo, $_userType, $_userNetto');
                } else {

                }

              }
              );

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
            },
            child: const Text('Закрыть')),
      ],
      //--------------------------------------
    );
  }

// 2ое диалоговое окно, информация вывод текста
  Widget _strokaDialogWindowOrder() {
    return Row(children: [
      stroka2()


    ],
    );
  }

  //--- ДИАЛОГОВОЕ ОКНО
  Widget _dialog() {
    return AlertDialog(
      title: const Text('Добавление заказа'),
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
          TextField(
            onChanged: (String value) {
              _userLogo = value;
            },
            decoration: const InputDecoration(hintText: "Логотип"),
            textAlign: TextAlign.center,
          ),
          TextField(
            onChanged: (String value) {
              _userType = value;
            },
            decoration: const InputDecoration(hintText: "Тип бутыли (X,G или др.)"),
            textAlign: TextAlign.center,
          ),
          TextField(
            onChanged: (String value) {
              _userNetto = value;
            },
            decoration: const InputDecoration(hintText: "Вес бутыли"),
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
                      '- $_userToDo, $_userLogo, $_userType, $_userNetto');
                  _userToDo = '';
                  _userLogo = '';
                  _userType = '';
                  _userNetto = '';
                  countOrder ++;

                } else {
                  _userToDo = '';
                  _userLogo = '';
                  _userType = '';
                  _userNetto = '';

                }

              }
                );

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
            },
            child: const Text('ОТПРАВИТЬ')),
      ],
    //--------------------------------------
    );
  }

  //--- ДИАЛОГОВОЕ ОКНО АНАЛИТИКИ
  Widget _analiticDetails() {
    return AlertDialog(
      title: const Text('Анализ данных'),
      //child: ListView(
      content: ListView(
        children: [
          Container(
          child: const Text('Здесь будет возможность строить графики и проводить аналитику по операторам, по машинам, по продукции. Но это потом.')),
          // ввести
        ],
      ),
      // КНОПКА ВНИЗУ У ВСПЛЫВАЮЩЕГО ОКНА
      actions: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (_userToDo != '') {
                  todoList1.add(
                      '- $_userToDo, $_userLogo, $_userType, $_userNetto');
                } else {

                }

              }
              );

              //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА
              Navigator.of(context).pop();
            },
            child: const Text('Закрыть')),
      ],
      //--------------------------------------
    );
  }

  Widget  stroka2() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
          //padding: EdgeInsets.only(top: 0, left: 5, right: 5),
          child: Text(vRabote1,
              style: const TextStyle(fontSize: 13, color: Colors.black)),
        ),

      ],
    );
  }

  Widget _stroka__() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
          child: const Text('-----------------',
              style: TextStyle(fontSize: 13, color: Colors.black)),
        ),

      ],
    );
  }

  Widget _stroka1() {
    return Row(children: [
      Container(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: const Text('PL-1:',
            style: TextStyle(
                fontSize: 20, color: Colors.orange)),
      ),
      Container(

        child: const Text('в работе',
            style: TextStyle(
                fontSize: 20, color: Colors.orange)),
      ),
      Container(
        //margin: EdgeInsets.only(top: 25),
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Image.network(
            'https://s1.iconbird.com/ico/0612/vistabasesoftwareicons/w256h2561339252506CircleGreen.png',
            width: 15,
            height: 15,
            fit: BoxFit.fill),
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
            margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
            child: const Text('готово 50%, брак 12%',
                style: TextStyle(
                    fontSize: 13, color: Colors.black)),
          ),
        ],
      );
  }

  Widget _stroka4Oper() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: const Text('Оператор: Иванов И.И.',
                style: TextStyle(
                    fontSize: 13, color: Colors.black)),
          ),
        ],
      );
  }

  //строка "Заказы в очереди"  itemCount: todoList.length,
  Widget _stroka5Order() {
    return
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Text('Заказы в очереди: $countOrder шт.',
                style: const TextStyle(
                    fontSize: 18, color: Colors.black)),
          ),
        ],
      );
  }

  //строка "Данные по выпуску продукции"
  Widget _stroka6() {
    return
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: const Text('Данные по выпуску продукции:',
                style: TextStyle(
                    fontSize: 18, color: Colors.black)),
          ),
        ],
      );
  }

  //строка "Заголовок Ремонт машины"
  Widget _remontTitle() {
    return
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: const Text('Данные по обслуживанию PL-1:',
                style: TextStyle(
                    fontSize: 18, color: Colors.black)),
          ),
        ],
      );
  }

  //строка информации про последним данным выпуска продукции
  Widget _stroka7() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
             child: const Expanded(
              child: Text('Последнее добавление: 128 шт., брак - 15 шт, Время: 15:24, Дата: 21.03.2024 ',
                style: TextStyle(
                    fontSize: 13, color: Colors.black,))),
          ),
        ],
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

  Widget _addOrder() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

                child: const Text('Время: 12:00, Дата: 21.03.2024',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14, color: Colors.black,)),
          ),


        ],
      );
  }

  Widget _addOrderTime1() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

            child: const Text('Время: 16:00, Дата: 21.03.2024',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14, color: Colors.black,)),
          ),


        ],
      );
  }

  Widget _addOrderTime2() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

            child: const Text('Время: 20:00, Дата: 21.03.2024',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14, color: Colors.black,)),
          ),


        ],
      );
  }

  Widget _addOrderTime3() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
            //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

            child: const Text('Время: 20:00, Дата: 21.03.2024',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14, color: Colors.black,)),
          ),


        ],
      );
  }

  Widget _addOrder2() {
    return
      Row(
        children: [

          Container(
            padding: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 5),
            //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

            child: const Text('240 шт., брак 26 шт.',
                style: TextStyle(
                  fontSize: 14, color: Colors.black,)),
          ),


        ],
      );
  }

  Widget _stroka8() {
    return
      Container(
        padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
        margin: const EdgeInsets.only(top: 0, left: 5, right: 5),
        child: Row(
            textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.only(top: 0, left: 5, right: 5),
                    //margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: const Expanded(
                        child: Text('Последнее добавление: 128 шт., брак - 15 шт, Время: 15:24, Дата: 21.03.2024',
                            style: TextStyle(
                              fontSize: 13, color: Colors.black,),
                            textDirection: TextDirection.ltr)
                    ),
                  )
                ]



        ),
      );
  }

  Widget _remontBriefly() {
    return
      Container(
        padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Row(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Container(
                //padding: EdgeInsets.only(top: 0, left: 5, right: 5),
                //margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: const Expanded(
                    child: Text('Время: 15:24, Дата: 21.03.2024, Ремонт машины, тех.обслуживание, просушка сырья. 2 часа',
                        style: TextStyle(
                          fontSize: 13, color: Colors.black,),
                        textDirection: TextDirection.ltr)
                ),
              )
            ]



        ),
      );
  }




}
