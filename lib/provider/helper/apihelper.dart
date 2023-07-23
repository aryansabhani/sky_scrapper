import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future getweather({required String Location}) async {
    String weatherapi =
        "http://api.weatherapi.com/v1/current.json?key=857e6eab0b414c1084b65918232307&q=$Location&aqi=yes";

    http.Response response = await http.get(Uri.parse(weatherapi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var currentweatherdata = await data;
      return currentweatherdata;
    }
  }


  Future alldayWeather({required String Location}) async {
    String weatherapi =
        "http://api.weatherapi.com/v1/history.json?key=857e6eab0b414c1084b65918232307&q=$Location&dt=${DateTime.now().toString()}";

    http.Response response = await http.get(Uri.parse(weatherapi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      List allData = await data['forecast']['forecastday'];
      return allData;
    }
  }

  nextdayWeather(){
    String 
  }
}
