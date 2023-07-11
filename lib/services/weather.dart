import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  static const String apiKey = '7edc169118cbd7964f36985882a11582';
  static const String mainUrl =
      'http://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getWeatherLocation() async {
    Location locationObj = Location();
    await locationObj.getCurrentLocation();
    NetworkingForAPI networkObj = await NetworkingForAPI(
        '$mainUrl?lat=${locationObj.latitudeForMain}&lon=${locationObj.longitudeForMain}&appid=$apiKey&units=metric');
    return await networkObj.getData();
  }

  Future<dynamic> cityWeather(String typed) async {
    NetworkingForAPI networkObj =
        await NetworkingForAPI('$mainUrl?q=$typed&appid=$apiKey&units=metric');
    return await networkObj.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
