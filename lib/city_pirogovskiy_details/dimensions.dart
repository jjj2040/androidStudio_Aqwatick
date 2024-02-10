import 'package:flutter/material.dart';

const double height8 = 8;
const double height2 = 2;

const double height64 = 64;
List todoList1 = ['= 2500, Судогорска, Х, 710 +-10'];
String  vRabote1 = "Заказ:500 шт, нейтр., X711111";


int countOrder = 0;

Widget _list3() {
  return ListView.separated(
    itemCount: todoList1.length,
    separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(height: height2);
    },
    itemBuilder: (BuildContext context, int index) {
      return Dismissible(
        key: Key(todoList1[index]),
        child: SizedBox(
          height: 45,

          child: Card(
            color: Colors.grey[300],
            child: ListTile(title: Text(todoList1[index]),),
          ),


        ),

        onDismissed:(direction){
         // setState((){
         //   countOrder --;
         //   todoList1.removeAt(index);
          });
        },

      );
}





