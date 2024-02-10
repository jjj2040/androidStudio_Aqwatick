import 'package:flutter/material.dart';

void main() { runApp(const MyApp()); }

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
class AddForme extends StatelessWidget {
  const AddForme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:const Text("Вернуться")
        ),
        body: Container(
          padding: const EdgeInsets.only(top:2, left:10, right:10, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],

          ),
          child: const Column(
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