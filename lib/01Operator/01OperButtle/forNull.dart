


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget forNull() {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
        //margin: EdgeInsets.only(top: 10, left: 5, right: 5),

        child: const Text('идет загрузка...',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            )),
      ),
    ],
  );
}

