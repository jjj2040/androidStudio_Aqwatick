


import 'dart:js';

import 'package:flutter/material.dart';

import 'dimensions.dart';

class listViewOrder extends StatelessWidget{
  const listViewOrder({super.key});

  @override
  Widget build(BuildContext context){
    return Stack(children: <Widget>[
      _list(),
      _updateButton(),
    ],    );

  }
  Widget _list(){
    return ListView.separated(
      itemCount: 15,
      separatorBuilder: (BuildContext context, index){
        return const SizedBox(height: height8);
      },
      itemBuilder: (BuildContext context, int index){
        return Container(height: height64, color: Colors.orange,);
      }
        );
  }

  Widget _updateButton(){
    return Container(
    );
  }


}