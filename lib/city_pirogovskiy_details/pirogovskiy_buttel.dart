import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled111/city_pirogovskiy_details/pirog_proba.dart';
import 'package:untitled111/style/style_text_Name.dart';

import 'details_bottel_2lev_part.dart';

var ddd = 'gggg';

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

class NameBottle2lev extends StatelessWidget {
  const NameBottle2lev({super.key});


@override
  Widget build(BuildContext context) {


    return Container(


      padding: EdgeInsets.only(top:15, left:10, right:10),
      color: Colors.grey[100],


      child: Column(

        //mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Container(
             child: MyTextPage111()
          ),

          // цех бутыли
//
          Container(
          // child: MyTextPage111(),

          ),
          /*        Container(
           // child: ASBroom(),
          ),

          Container(
          //  child: CorkRoom(),
          ),

 */




        ],


      ),

    );
  }
}