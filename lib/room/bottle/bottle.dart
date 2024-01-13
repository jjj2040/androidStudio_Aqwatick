import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Bottle extends StatelessWidget {
  const Bottle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('hhhhhhaaaa11',
              style: TextStyle(
                fontSize: 20,
                color: Colors.orange)
            ),
            )

          ],

        ),

    );
  }
}