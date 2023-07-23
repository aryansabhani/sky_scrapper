import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/provider/apiprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle uperstyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    TextStyle lowerstyle = TextStyle(
      fontSize: 12,
    );
    return Consumer<WeatherProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Weather App "),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  onSubmitted: (value) {
                    provider.getnewWeather(LocationName: value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "${provider.current?['location']['name']}".toUpperCase(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Text(
                  "${provider.current?['location']['region']},${provider.current?['location']['country']}"
                      .toUpperCase(),
                  style: TextStyle(fontSize: 28, color: Colors.grey.shade600),
                ),
                Text(
                  "${provider.current?['location']['localtime']}".toUpperCase(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${provider.current?['current']['temp_c']} °C",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Image.network(
                    "https:${provider.current?['current']['condition']['icon']}"),
                Text(
                  "${provider.current?['current']['condition']['text']}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: MediaQuery.of(context).devicePixelRatio,
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Forecast for Today",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),Divider(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                provider.allday[0]['hour'].length,
                                (index) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("${provider.allday[0]['hour'][index]['time']}"
                                            .substring(
                                                "${provider.allday[0]['hour'][index]['time']}"
                                                    .indexOf(' '),
                                                16)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Image.network(
                                            "http:${provider.allday[0]['hour'][index]['condition']['icon']}"),
                                        Text(
                                            "${provider.allday[0]['hour'][index]['temp_c']}°C"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(),
                                        Image.network(
                                            "https://cdn-icons-png.flaticon.com/128/9231/9231936.png",
                                            height: 35),
                                        Text(
                                            "${provider.allday[0]['hour'][index]['wind_kph']}km"),
                                        Divider(),
                                        Image.network(
                                            "https://cdn-icons-png.flaticon.com/128/1628/1628763.png",
                                            height: 35),
                                        Text(
                                            "${provider.allday[0]['hour'][index]['humidity']}%"),
                                      ],
                                    ))),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "7 day forecast",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Date", style: uperstyle),
                            SizedBox(
                              height: 25,
                            ),
                            Text("Sun\nRise", style: uperstyle),
                            Text("Sun\nSet", style: uperstyle),
                            Text("Max\nTemp", style: uperstyle),
                            Text("Min\nTemp", style: uperstyle),
                            Text("Weather", style: uperstyle),
                          ]),
                      Column(
                        children: List.generate(
                          provider.NextDayWeather.length,
                          (index) => SingleChildScrollView(
                            child: Column(
                              children: [
                                Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${provider.NextDayWeather[index]['date']}",
                                      style: lowerstyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${provider.NextDayWeather[index]['astro']['sunrise']}"
                                          .substring(0, 6),
                                      style: lowerstyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${provider.NextDayWeather[index]['astro']['sunset']}"
                                          .substring(0, 6),
                                      style: lowerstyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${provider.NextDayWeather[index]['day']['maxtemp_c']}°C",
                                      style: lowerstyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${provider.NextDayWeather[index]['day']['mintemp_c']}°C",
                                      style: lowerstyle,
                                    ),
                                    Image.network(
                                      "http:${provider.NextDayWeather[index]['day']['condition']['icon']}",
                                      height: 70,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
