import 'package:flutter/material.dart';

var ddd = 'gggg';

class name_rostov extends StatelessWidget {
  const name_rostov({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.only(top:5, left:30, right:30, bottom: 15),
      margin: const EdgeInsets.only(top:20,  bottom:10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.blueGrey,
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
      //color: Colors.lightBlueAccent,
      child: const Column(

        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [

          Text(
            'Ростов-на-Дону',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,

            ),
          ),
        ],
      ),

    );
  }
}