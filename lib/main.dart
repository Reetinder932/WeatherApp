//  import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/Activity/Home.dart';
import 'package:weatherapp/Activity/Loading.dart';
import 'package:weatherapp/Activity/Bg.dart';



void main() {
  runApp(MaterialApp(
    routes: {
      "/":(context)=>Loading(),
      "/Home":(context) =>Home(),
      // "/Bg":(context)=>Bg(),
      "/Loading":(context)=>Loading()
    },
  ));
}


