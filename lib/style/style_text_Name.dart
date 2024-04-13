import 'package:flutter/material.dart';
import 'package:untitled111/01_Operator_PL1/01OperButtle/operatorButtle.dart';




class Stylename extends OperatorButtle {
  const Stylename ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );
  }
}


const textStyleFontSize15_Orange = TextStyle(fontSize: 15, color: Colors.orange);
const textStyleFontSize20_Orange = TextStyle(fontSize: 20, color: Colors.orange);


const textStyleColorBlack = TextStyle(color: Colors.black);





