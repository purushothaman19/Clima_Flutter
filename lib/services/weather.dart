import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = "5a7af1cdebc3053b2ede14ca80d7df02";
const openWeatherMapURI = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic>  getCityData(String cityName) async {

    var uri = Uri.parse('$openWeatherMapURI?q=$cityName&appid=$apikey&units=metric');

    NetworkData networkData = NetworkData(uri: uri);

    var weatherData = await networkData.getData();

    return weatherData;

  }

  Future<dynamic> getLocationData() async {

    Location location = Location();
    await location.getCurrentLocation();

    var uri = Uri.parse('$openWeatherMapURI?lat=${location.latitude}&lon='
        '${location.longitude}&appid=$apikey&units=metric');

    NetworkData networkData = NetworkData(uri: uri);

    var weatherData = await networkData.getData();

    return weatherData;

  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
