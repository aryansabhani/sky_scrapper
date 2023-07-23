import 'package:flutter/material.dart';
import 'package:sky_scrapper/provider/helper/apihelper.dart';

class WeatherProvider extends ChangeNotifier {
  Map<String, dynamic>? current;
  List allday = [];
  List NextDayWeather= [];

  WeatherProvider() {
    getnewWeather();
    allDayWeather();
    nextdayWeather();
  }

  getnewWeather({String LocationName = "surat"}) async {
    current = await ApiHelper.apiHelper.getweather(Location: LocationName);
    notifyListeners();
  }

  allDayWeather({String LocationName = "surat"}) async {
    allday = await ApiHelper.apiHelper.alldayWeather(Location: LocationName);

    notifyListeners();
  }

  nextdayWeather({String LocationName = "surat"}) async {
    NextDayWeather =
        await ApiHelper.apiHelper.nextdayWeather(Location: LocationName);
    print(
        "============================================================================");
    print("${NextDayWeather}");

    notifyListeners();
  }
}
