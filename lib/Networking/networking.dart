import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Data {
  Data({required this.position});

  Position position;
  late double latitude = position.latitude;
  late double longitude = position.longitude;
  String keyip = "e2cf045dcb5e5e4bb93d4cb93d535eff";

  void getData() async {
    print(latitude);
    var url = await Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$keyip');
    http.Response response = await http.post(url);
    if (response.statusCode == 200) {
      print("hey statecode is 200 printed ");
      String data = response.body;

      var temperature = jsonDecode(data)["main"]["temp"];
      print(temperature);
      var condition = jsonDecode(data)['weather'][0]['id'];
      print(condition);
      String city = jsonDecode(data)['name'];
      print(city);
      Displaydata(
          latitude: latitude,
          longitude: longitude,
          temperature: temperature,
          city: city,
          condtion: condition);
    } else
      print(latitude);
    print(response.statusCode);
  }
}

class Displaydata {
  Displaydata(
      {this.latitude,
        this.longitude,
        this.temperature,
        this.city,
        this.condtion});

  double? latitude;
  double? longitude;
  double? temperature;
  String? city;
  int? condtion;

}
