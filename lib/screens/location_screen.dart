import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen(this.locationWeather, {super.key});
  final locationWeather;

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  late int themperature;
  late int condition;
  late String cityName;
  late String weatherIcon;
  late String messageOfWeather;
  String inStr = 'in';
  late double latt;
  late double long;

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  void updateUI(dynamic decodeData) {
    setState(
      () {
        if (decodeData == null) {
          themperature = 0;
          condition = 0;
          weatherIcon = '';
          cityName = '';
          messageOfWeather = '';
          inStr = "enter a city with correct letters".toUpperCase();
          return;
        } else {
          inStr = '';
        }
        WeatherModel weatherModelObj = WeatherModel();
        double themperatureThemporyDoubleValue = decodeData['main']['temp'];
        themperature = themperatureThemporyDoubleValue.toInt();
        condition = decodeData['weather'][0]['id'];
        weatherIcon = weatherModelObj.getWeatherIcon(condition);
        cityName = decodeData['name'];
        messageOfWeather = weatherModelObj.getMessage(themperature);
      },
    );
  }

  void updateUIBackWhenCityName(dynamic decodeData) {
    setState(
      () {
        WeatherModel weatherModelObj = WeatherModel();
        cityName = decodeData[0]['name'];
        latt = decodeData[0]['lat'];
        long = decodeData[0]['lat'];
        inStr = "";
        messageOfWeather = weatherModelObj.getMessage(themperature);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherData =
                            await WeatherModel().getWeatherLocation();
                        updateUI(weatherData);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var cityName = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CityScreen();
                        }));
                        if (cityName != null) {
                          var dataOfStr =
                              await WeatherModel().cityWeather(cityName);
                          updateUI(dataOfStr);
                        } else {
                          inStr = "please enter a city".toUpperCase();
                        }
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        ' $themperature° ',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    "$messageOfWeather $inStr $cityName!",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
