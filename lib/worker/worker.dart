// import 'dart:ffi';
import 'package:http/http.dart';
import 'dart:convert';
class worker{
  String location="";

  worker(this.location){
    location=this.location;
  }

  String humidity="";
  String temp="";
  String air_speed="";
  String description="";
  String main="";
  String icon="";



  Future<void> getdata() async{
    try{
      Response response= await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2a6d0748c651d190f40871d6f86f3ceb"));
      Map data=jsonDecode(response.body);
      List weather_data=data['weather'];
      Map weather_m_data=weather_data[0];
      String getmain=weather_m_data['main'];
      String desc =weather_m_data['description'];




      Map temp_data=data['main'];
      String gethumidity=temp_data['humidity'].toString();
      double gettemp=temp_data['temp']-273.15;


      Map wind=data['wind'];
      double getair_speed=wind['speed']/0.27777777777778;

      temp=gettemp.toString();
      humidity=gethumidity;
      air_speed=getair_speed.toString();
      description=desc;
      main=getmain;
      icon=weather_m_data['icon'].toString();
    }catch(e)
    {
      print(e);
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "09d";
    }

  }

}
 //worker instance=worker("Mumbai");
