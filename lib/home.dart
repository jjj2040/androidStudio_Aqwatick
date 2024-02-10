import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      //initialRoute: '/',
      //routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
      //  '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
       // '/second': (context) => const SecondScreen(),
      //  '/third': (context) => const ThScreen(),
     // },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('First Screen'),
      // ),
      body:
      Padding(padding: const EdgeInsets.all(0.0),

        child: Container(
            padding: const EdgeInsets.only(top:25, left:10, right:10),
            color: Colors.white,
            child: const Text("Hello Flutter from Metanit.com",
                textDirection: TextDirection.ltr,       // текст слева направо
                textAlign: TextAlign.center,            // выравнивание по центру
                style: TextStyle(color: Colors.green,   // зеленый цвет текста
                    fontSize: 26,                       // высота шрифта 26
                    backgroundColor: Colors.black87     // черный цвет фона текста
                )
            )
        )
      ),
    );
  }
}

    //crossAxisAlignment: CrossAxisAlignment.stretch,