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
class MyTextPage11111 extends StatelessWidget {
  const MyTextPage11111({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:const Text("Вернуться")
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],

          ),
          child: const Column(
            //padding: EdgeInsets.only(top:5, left:5, right:5),
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Text(
                  'Пироговский, цех бутыли',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    //decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // состояние
                Column(

                ),
              ]
          ),
        )
    );
  }
}