import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
//  import 'package:js/js.dart';
// import 'dart:convert';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';


class Bg extends StatefulWidget {
  const Bg({Key? key}) : super(key: key);

  @override
  State<Bg> createState() => _HomeState();
}

class _HomeState extends State<Bg> {
  TextEditingController searchController = new TextEditingController();

  // void timer(){
  //   Future.delayed(Duration(seconds: 5),(){
  //     print("alaarm is ringing");
  //   });
  // }
  // String username="a";
  // void  getData() async {
  //   await Future.delayed(Duration(seconds: 3),(){
  //     username="Reet";
  //   }
  //   );
  //   print("$username");
  // }
  // void getdata() async {
  //   Response response = await get(Uri.parse("https://mytimeapi.herokuapp.com/time/Asia/Kolkata"));
  //   // print(response.body);
  //   Map data=jsonDecode(response.body);
  //   print(data['date']);
  // }
  // void getdata() async{
  //   Response response= await get(Uri.parse("uri"));
  //   Map data=jsonDecode(response.body);
  //   // Map main_data=data['main'];
  //   // int temp=main_data['temp'];
  //   List weather_data=data['weather'];
  //   Map weather_m_data=weather_data[0];
  //   String main=weather_m_data['main'];
  //   print(main);
  // }

  // int counter = 0;


  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map;
    // var city_name = ["Mumbai", "Delhi", "Chennai", "Hoshiarpur"];
    //final _random = new Random();
    //var city = city_name[_random.nextInt(city_name.length)];
    String temp = ((info['temp_value']).toString());
    String air = ((info['air_speed_value']).toString());
    if (temp == "NA") {
      print("NA");
    }
    else {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 4);
    }
    String icon = info['icon_value'];
    String city1 = info['city_value'];
    String Hum = info['hum_value'];
    String des = info['des_value'];
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Colors.blue,
                    Colors.blueAccent,
            ])),

            ),
          ],

        ),
      ),
    );
  }
}
