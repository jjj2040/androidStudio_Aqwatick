import 'package:flutter/material.dart';

class Bottle extends StatelessWidget {
  const Bottle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text('hhhhhhaaaa11',
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