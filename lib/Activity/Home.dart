import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
//  import 'package:js/js.dart';
// import 'dart:convert';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("set state is called");
  }

  @override
  void initState() {
    super.initState();
    // getdata();
    print("this is init state");
  }

  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)?.settings.arguments as Map;
   // var city_name = ["Mumbai", "Delhi", "Chennai", "Hoshiarpur"];
    //final _random = new Random();
    //var city = city_name[_random.nextInt(city_name.length)];
    String temp =  ((info['temp_value']).toString());
    String air = ((info['air_speed_value']).toString());
    if(temp == "NA")
    {
      print("NA");
    }
    else
    {
      temp =  ((info['temp_value']).toString()).substring(0,4);
      air = ((info['air_speed_value']).toString()).substring(0,4);
    }
    String icon = info['icon_value'];
    String city1 = info['city_value'];
    String Hum = info['hum_value'];
    String des = info['des_value'];

   // if("$icon"=="04d"){

   // }
    return Scaffold(
        // appBar: PreferredSize(
        //     preferredSize: Size.fromHeight(0),
        //     child: AppBar(
        //       backgroundColor: Colors.blue[400],
        //     )),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          gradient:LinearGradient(
            colors: [
              Colors.blue,
              Colors.lightBlue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
          ,
        ),
      ),
        body: SafeArea(
          child: Container(

            decoration: BoxDecoration(
                image: DecorationImage(
    image: AssetImage("Images/clouds.jpg"),
    fit: BoxFit.cover
                )
    ),
            child: Column(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.all(7),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == ""){
                            print("Blank Screen");
                          }else {
                            Navigator.pushNamed(
                                context, "/Loading", arguments: {
                              "searchText": searchController.text,
                            });
                          }
                        },
                        child:Container(
                        child: Icon(Icons.location_on_rounded),
                      ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ("Search here for city")),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        padding: EdgeInsets.all(26),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            Column(
                              children: [
                                Text("$des",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                Text("in $city1",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        padding: EdgeInsets.all(26),
                        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$temp",style: TextStyle(fontSize: 90),),
                              Text("C",style: TextStyle(fontSize: 35),)
                            ],
                          )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        padding: EdgeInsets.all(26),
                        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.wind),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("$air",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                            Text("Km/hr")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        padding: EdgeInsets.all(26),
                        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("$Hum",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                                SizedBox(width:10),
                                Text("Percent"),

                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Text("Made by Reetinder"),
                    ],
                  ),
                )
              ],
            ),
          ),


        ));
  }
}
