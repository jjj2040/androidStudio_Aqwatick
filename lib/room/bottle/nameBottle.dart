import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled111/style/style_text_Name.dart';

import '../../city_pirogovskiy_details/details_bottel_2lev_part.dart';
import '../../city_pirogovskiy_details/pirog_proba.dart';
import '../../city_pirogovskiy_details/pirogovskiy_buttel.dart';

// ЦЕХ БУТЫЛИ



class nameBottle extends StatelessWidget {
  const nameBottle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:2, left:10, right:10, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.35),
            blurRadius: 4,
          ),
        ],
              ),


      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        //название цеха кнопка переход
        children: [


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
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: MyTextPage111())
                  );
                  // Делаем что-нибудь, когда кнопка нажата.
                },
                child: Text('ЦЕХ БУТЫЛИ',
                style: TextStyle(
                  color: Colors.black
                ),
                ),

              ),



          // состояние
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top:5, left:5, right:5),
                child: Text('PL-1:',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),

              Container(
                padding: EdgeInsets.only(top:5, left:5, right:5),
                child: Text('в работе',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Image.network('https://s1.iconbird.com/ico/0612/vistabasesoftwareicons/w256h2561339252506CircleGreen.png',
                  width: 15,
                  height: 15,
                    fit:BoxFit.fill
                ),

              )


            ],

          ),

          // вторая строка текста
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top:0, left:5, right:5),
                child: Text('Заказ:500 шт, нейтр., X71',
                    style: TextStyle(
                        fontSize: 10,

                        color: Colors.black)
                ),
              ),

              Container(
                padding: EdgeInsets.only(top:0, left:5, right:5),
                child: Text('готово 50%, брак 12%',
                    style: TextStyle(
                        fontSize: 10,

                        color: Colors.black)
                ),
              ),


            ],

          ),

          // третья строка текста
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top:5, left:5, right:5),
                child: Text('PL-3:',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),

              Container(
                padding: EdgeInsets.only(top:5, left:5, right:5),
                child: Text('остановлена',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),


            ],

          )






        ],

      ),

    );
  }
}