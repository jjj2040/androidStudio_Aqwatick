

//import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:untitled111/bottomnavbar.dart';
import 'package:untitled111/password.dart';
//import 'package:page_transition/page_transition.dart';
import 'package:mysql1/mysql1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
    runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( ),

      home: Password(),
    );
  }

}

//home: BottomNavBar(),