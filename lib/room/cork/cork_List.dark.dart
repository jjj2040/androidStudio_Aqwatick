


import 'package:flutter/material.dart';

//import 'AsbListData2level.dart';
import 'corkList2Level.dart';

class CorkVehiclList extends StatelessWidget{
  const CorkVehiclList({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лист корк',
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )  ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,

      ),

      body: Container(color: Colors.blue,
        child: const CorklList2Level(),


      ),

    );

  }


}