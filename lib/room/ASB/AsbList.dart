


import 'package:flutter/material.dart';

import 'AsbListData2level.dart';

class VehiclList extends StatelessWidget{
  const VehiclList({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: const Text('Лист1',
      style: TextStyle(
        color: Colors.cyan,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      )  ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,

      ),

      body: Container(color: Colors.lime,
      child: VehiclList2Level(),


      ),

    );

  }


}