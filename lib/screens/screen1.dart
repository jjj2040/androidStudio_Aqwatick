import 'package:flutter/material.dart';
import 'package:untitled111/room/ASB/ASB_room.dart';
import 'package:untitled111/room/cork/cork_room.dart';

import '../room/bottle/nameBottle.dart';
import '../room/bottle/pirogovskiy.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top:5, left:10, right:10),
      color: Colors.grey[100],

     // child: Column(
      child: ListView(

            //mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Container(
                child: const name_pirogov()
              ),

              // цех бутыли

              Container(
                child: const nameBottle(),

                ),
              Container(
                child: const ASBroom(),
              ),

              Container(
                child: const CorkRoom(),
              ),


            ],


      ),
    );
  }
}