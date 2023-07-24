import 'package:flutter/material.dart';
import 'package:sky_scrapper/provider/helper/apihelper.dart';

class WeatherProvider extends ChangeNotifier {
  Map<String, dynamic>? current;
  late List allday = [];
  List NextDayWeather= [];
  bool theme = false;
  WeatherProvider() {
    getnewWeather();
    allDayWeather();
    nextdayWeather();
  }

  ChangeTheme({required bool val}){
    theme = val;
    notifyListeners();
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
