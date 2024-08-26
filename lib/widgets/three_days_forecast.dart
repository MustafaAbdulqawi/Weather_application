import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/models/weather_model.dart';

class ThreeDaysForeCast extends StatelessWidget {
  final WeatherModel weatherModel;
  const ThreeDaysForeCast({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    returnDateName({required String dateName}) {
      DateTime date = DateTime.parse(dateName);
      DateTime today = DateTime.now();
      if (DateFormat('yyyy-MM-dd').format(date) == DateFormat('yyyy-MM-dd').format(today)) {
        return 'Today';
      } else {
        return DateFormat('EEEE').format(date);
      }

    }

    return Container(
      width: 343,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFFD9D9D9).withOpacity(0.2),
        image: DecorationImage(
          image: const AssetImage('assets/Rectangle 1.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: weatherModel.forecast!.forecastday!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    returnDateName(
                        dateName: weatherModel
                            .forecast!.forecastday![index].date
                            .toString()),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.network(
                  "https:${weatherModel.forecast!.forecastday![index].day!.condition!.icon}",
                  height: 30,
                ),
                const SizedBox(
                  width: 25,
                ),
                Row(
                  children: [
                    Text(
                      weatherModel.forecast!.forecastday![index].day!.mintemp_c
                          .toString()
                          .split(".")[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Text(
                      "°",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                ///////////////////////////////////////
                Image.asset("assets/Line 4.png"),
                const SizedBox(
                  width: 7,
                ),
                Row(
                  children: [
                    Text(
                      weatherModel.forecast!.forecastday![index].day!.maxtempC
                          .toString()
                          .split(".")[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Text(
                      "°",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
