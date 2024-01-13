//старый вариант меню
/*
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


  final screen = [
    home(),
    home(),
    home(),
    home(),
    home(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
      Icon(Icons.call_split, size: 30),
      Icon(Icons.perm_identity, size: 30),
    ];



    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: items,

        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),

      body: //screen[index],

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_page.toString(), textScaleFactor: 10.0),
            ElevatedButton(
              child: Text('Go To Page of index 1'),
              onPressed: () {
                final CurvedNavigationBarState? navBarState =
                    _bottomNavigationKey.currentState;
                navBarState?.setPage(1);
              },
            )
          ],


        ),
      ),
    );
  }
}










//добавочный класс
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('First Screen'),
      // ),
      body:
      Padding(padding: const EdgeInsets.all(0.0),

          child: Container(
              padding: EdgeInsets.only(top:25, left:10, right:10),
              color: Colors.white,
              child: Text("Hello Flutter from Metanit.com",
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


 */