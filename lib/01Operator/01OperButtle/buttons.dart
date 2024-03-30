
import 'package:flutter/material.dart';

var contextClose = 'context';

@override
class ButtonNo{
  buttonNo(){
    ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(
                110, 50)
        ),
        onPressed: () {
          //ЗАКРЫТИЕ ВСПЛЫВАЮЩЕГО ОКНА

         // Navigator.of(context).pop();
        },
        child: const Text('Нет'));
  }
}







