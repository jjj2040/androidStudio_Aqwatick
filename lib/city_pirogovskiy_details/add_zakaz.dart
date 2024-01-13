import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:page_transition/page_transition.dart';

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
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
class AddForme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("Вернуться")
        ),
        body: Container(
          padding: EdgeInsets.only(top:2, left:10, right:10, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],

          ),
          child: Column(
            //padding: EdgeInsets.only(top:5, left:5, right:5),
            //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Text(
                  'Всплывающая форма отплавления заказа',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    //decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
          ]


          ),
        )
    );
  }
}