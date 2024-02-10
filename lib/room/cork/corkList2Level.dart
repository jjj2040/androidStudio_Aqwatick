import 'package:flutter/material.dart';
import 'package:untitled111/city_pirogovskiy_details/dimensions.dart';

class CorklList2Level extends StatelessWidget {
  const CorklList2Level({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: const Text('в работе',
              style: TextStyle(
                  fontSize: 20, color: Colors.orange)),
        ),

        //бокс для вывода ListView
        SizedBox(
          height: 100, // Constrain height.
          child: _list2(),
        ),

        Container(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: const Text('в работе',
              style: TextStyle(
                  fontSize: 20, color: Colors.orange)),
        ),


      ],
    );
  }



  Widget _list2() {
    return ListView(
      children: const [
        Text('333'),
        Text('3331'),
        Text('333'),
        Text('331'),
        Text('33'),
        Text('331'),
        Text('331'),
        Text('111'),
        Text('111'),
        Text('111'),
      ],
    );

    }

  Widget _block2() {
    return Container(
      height: 200,
      color: Colors.white10,
      child: const Text('1111111111'),
    );
  }


  Widget _block() {
    return Container(
      height: 200,
      color: Colors.white10,
      child: const Text('1111111111'),
    );
  }


  Widget _list() {
    return ListView.separated(
        itemCount: 15,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: height8);
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: height64,
            color: Colors.green,
          );
        });
  }
}
