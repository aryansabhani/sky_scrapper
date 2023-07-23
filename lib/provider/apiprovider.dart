import 'package:flutter/material.dart';
import 'package:sky_scrapper/provider/helper/apihelper.dart';

class WeatherProvider extends ChangeNotifier {
  Map<String, dynamic>? current;
  List allday = [];

  WeatherProvider() {
    getnewWeather();
    allDayWeather();
  }

  getnewWeather({String LocationName = "surat"}) async {
    current = await ApiHelper.apiHelper.getweather(Location: LocationName);
    notifyListeners();
  }

  allDayWeather({String LocationName = "surat"}) async {
    allday = await ApiHelper.apiHelper.alldayWeather(Location: LocationName);
    print("============================================================================");
    print("${allday[0]['hour'].length}");

    notifyListeners();
  }
}
