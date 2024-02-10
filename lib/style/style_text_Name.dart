import 'package:flutter/material.dart';



class Stylename extends StatelessWidget {
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
