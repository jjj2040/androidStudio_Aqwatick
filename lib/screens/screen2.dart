import 'package:flutter/material.dart';
import 'package:untitled111/City/pushkino.dart';

import '../room/bottle/nameBottle.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top:15, left:10, right:10),
      color: Colors.grey[100],
      child: Column(

        //mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Container(
              child: const name_pushk()
          ),

          // цех бутыли

          Container(
            child: const nameBottle(),

          ),
          Container(
         //   child: ASBroom(),
          ),

          Container(
         //   child: CorkRoom(),
          ),




        ],


      ),
    );
  }
}