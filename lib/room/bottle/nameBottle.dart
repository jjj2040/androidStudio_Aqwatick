import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled111/01Operator/01OperButtle/clasesGiveDate.dart';
import 'package:untitled111/01Operator/01OperButtle/operatorButtle.dart';
import 'package:untitled111/data/dataPartOrder.dart';
import 'package:untitled111/nameOperator.dart';

import '../../city_pirogovskiy_details/details_bottel_2lev_part.dart';

// ЦЕХ БУТЫЛИ



class nameBottle extends StatelessWidget {
  const nameBottle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 15),
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
              Navigator.push(context, PageTransition(
                  type: PageTransitionType.fade, child: const MyTextPage111())
              );
              // Делаем что-нибудь, когда кнопка нажата.
            },
            child: const Text('ЦЕХ БУТЫЛИ',
              style: TextStyle(
                  color: Colors.black
              ),
            ),

          ),


          Column(
            children: <Widget>[
              readStatus(),
              nameOperator11(),
              jobNow(),
              GiveOrderForOperator().giveBaseOrderForOperator(),
              //заказ сколько надо сделать
              displaySummaDataOrder1(),

            ],
          ),


          // третья строка текста
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: const Text('PL-3:',
                    style: TextStyle(
                        fontSize: 20,

                        color: Colors.orange)
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: const Text('остановлена',
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
