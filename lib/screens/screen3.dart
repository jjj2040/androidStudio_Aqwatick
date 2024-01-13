import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled111/City/rostov.dart';

import '../room/ASB/ASB_room.dart';
import '../room/bottle/nameBottle.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top:15, left:10, right:10),
      color: Colors.grey[100],
      child: Column(

        //mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Container(
              child: name_rostov()
          ),

          // цех бутыли

          Container(
              //child: nameBottle(),

          ),
          Container(
              child: ASBroom(),
          ),

          Container(
            //   child: CorkRoom(),
          ),




        ],


      ),
    );
  }
}