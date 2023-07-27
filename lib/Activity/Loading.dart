import 'package:flutter/material.dart';
import 'package:weatherapp/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

String Temperature = "";
String humidity = "";
String air_speed = "";
String description = "";
String main1 = "";
String icon1 = "";
String city = "Mumbai";

class _LoadingState extends State<Loading> {
  void startApp( String city) async {
    worker instance = worker(city);
    await instance.getdata();
    Temperature = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    description = instance.description;
    main1 = instance.main;
    icon1 = instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/Home', arguments: {
        "temp_value": Temperature,
        "hum_value": humidity,
        "air_speed_value": air_speed,
        "des_value": description,
        "main_value": main1,
        "icon_value": icon1,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     Map?search = ModalRoute.of(context)?.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("Images/OIP__1_-removebg-preview (1).png"),
            SizedBox(height: 20),
            Text(
              "Weather App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Made By Reetinder",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitHourGlass(
              color: Colors.black,
              size: 80.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}
