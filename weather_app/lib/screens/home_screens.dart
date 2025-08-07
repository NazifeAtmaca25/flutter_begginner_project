import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/dummy_data.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  String _selectedCity="İstanbul";
  @override
  Widget build(BuildContext context) {
    Weather weather=dummyWeaterData[_selectedCity]!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hava Durumu",style: TextStyle(fontSize: 30),),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton(
            value: _selectedCity,
              items: dummyWeaterData.keys.map((city){
            return DropdownMenuItem(value: city,child: Text(city),);
          }).toList(), onChanged: (value){
              if(value !=null){
                setState(() {
                  _selectedCity=value;
                });
              }
          }),
          SizedBox(height: 16,),
          Text(weather.city,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          Text(weather.date,style: TextStyle(color: Colors.grey),),
          SizedBox(height: 8,),
          Row(
            children: [
              Image.asset(getWeatherIcon(weather.condition),
              width: 64,
              height: 64,),
              SizedBox(width: 15,),
              Text("${weather.temperature}°C",
              style: TextStyle(fontSize: 40),)
            ],
          ),
          SizedBox(height: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: weather.forecast.map((forecast){
              return Padding(padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(forecast.day,style: TextStyle(fontSize: 16),),
                Image.asset(getWeatherIcon(forecast.condition,),width: 32,height: 32,),
                  Text(
                    '${forecast.maxTemp}° / ${forecast.minTemp}°',
                    style: const TextStyle(fontSize: 16),
                  ),],
              ),);
            }).toList()
          )

        ],
      ),),
    );
  }
}
String getWeatherIcon(String condition){
  switch(condition){
    case 'güneşli':
      return 'assets/sunny.jpg';
    case 'bulutlu':
      return 'assets/cloudy.png';
      case 'rüzgarlı':
    return 'assets/stormy.png';
    case 'yağmurlu':
    return 'assets/rainy.png';
    default:
      return 'assets/cloudy.png';

  }
}
