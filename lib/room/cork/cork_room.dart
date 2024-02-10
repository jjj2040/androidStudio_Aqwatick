import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'cork_List.dark.dart';

var ddd = 'gggg';

class CorkRoom extends StatelessWidget {
  const CorkRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:2, left:10, right:10, bottom: 15),
      margin: const EdgeInsets.only(top:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.35),
            blurRadius: 4,
          ),
        ],
        /*gradient: LinearGradient(
            colors:[
              Colors.lightBlueAccent,
              Colors.lightGreenAccent,
              Colors.lightBlueAccent,
            ]
        ),*/
      ),


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          //название цеха
          ElevatedButton(

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
              // Делаем что-нибудь, когда кнопка нажата.
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const CorkVehiclList()));
            },
            child: const Text('ЦЕХ ПРОБКИ',
              style: TextStyle(
                  color: Colors.black
              ),
            ),

          ),

          // состояние
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top:5, left:5, right:5),
                child: const Text('Машина:',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top:5, left:5, right:5),
                child: const Text('в работе',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),


            ],

          ),

          // вторая строка текста
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top:0, left:5, right:5),
                child: const Text('Заказ:500 шт, нейтр., X71',
                    style: TextStyle(
                        fontSize: 10,

                        color: Colors.black)
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top:0, left:5, right:5),
                child: const Text('готово 50%, брак 12%',
                    style: TextStyle(
                        fontSize: 10,

                        color: Colors.black)
                ),
              ),


            ],

          ),

          // третья строка текста







        ],

      ),

    );
  }
}