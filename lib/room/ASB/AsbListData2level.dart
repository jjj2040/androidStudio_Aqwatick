import 'package:flutter/material.dart';

class VehiclList2Level extends StatelessWidget {
  //const VehiclList2Level({super.key});

  final List _todoList = [];

  VehiclList2Level({super.key});

/*@override
 void initState(){
  super.initState();

  _todoList.addAll(['dfdfdfd', 'ghghghgh']);
 }

 */

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      //_block(),
      _list(),
      //_update()
     ]);
  }


  Widget _list() {
    return ListView.builder(
        itemCount: _todoList.length,

        itemBuilder: (BuildContext context, int index) {
          return Dismissible(key: Key(_todoList[index]),
              child: const Card()
          );
        });
  }



  Widget _block() {
    return Container(
      height: 200,
      color: Colors.white10,

      child: const Text('1111111111'),
    );
  }



  Widget _update() {
    return Container();
  }
}
