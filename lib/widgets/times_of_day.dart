import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';

class TimesOfDay extends StatelessWidget {
 final WeatherModel weatherModel;
  const TimesOfDay({super.key ,required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 121,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "7AM",
                style: TextStyle(
                    color: Colors.white, fontSize: 15),
              ),
              Image.network(
                "https:${weatherModel.forecast!.forecastday![0].hour![7].condition!.icon}",
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    weatherModel.forecast!.forecastday![0]
                        .hour![7].tempC
                        .toString()
                        .split(".")[0],
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                  const Text(
                    "°",
                    style: TextStyle(
                        color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "10AM",
                style: TextStyle(
                    color: Colors.white, fontSize: 15),
              ),
              Image.network(
                "https:${weatherModel.forecast!.forecastday![0].hour![10].condition!.icon}",
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    weatherModel.forecast!.forecastday![0]
                        .hour![10].tempC
                        .toString()
                        .split(".")[0],
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                  const Text(
                    "°",
                    style: TextStyle(
                        color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "2PM",
                style: TextStyle(
                    color: Colors.white, fontSize: 15),
              ),
              Image.network(
                "https:${weatherModel.forecast!.forecastday![0].hour![14].condition!.icon}",
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    weatherModel.forecast!.forecastday![0]
                        .hour![14].tempC
                        .toString()
                        .split(".")[0],
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                  const Text(
                    "°",
                    style: TextStyle(
                        color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "6PM",
                style: TextStyle(
                    color: Colors.white, fontSize: 15),
              ),
              Image.network(
                "https:${weatherModel.forecast!.forecastday![0].hour![17].condition!.icon}",
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    weatherModel.forecast!.forecastday![0]
                        .hour![17].tempC
                        .toString()
                        .split(".")[0],
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                  const Text(
                    "°",
                    style: TextStyle(
                        color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "9PM",
                style: TextStyle(
                    color: Colors.white, fontSize: 15),
              ),
              Image.network(
                "https:${weatherModel.forecast!.forecastday![0].hour![21].condition!.icon}",
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    weatherModel.forecast!.forecastday![0]
                        .hour![21].tempC
                        .toString()
                        .split(".")[0],
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                  const Text(
                    "°",
                    style: TextStyle(
                        color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "11PM",
                style: TextStyle(
                    color: Colors.white, fontSize: 15),
              ),
              Image.network(
                "https:${weatherModel.forecast!.forecastday![0].hour![23].condition!.icon}",
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    weatherModel.forecast!.forecastday![0]
                        .hour![23].tempC
                        .toString()
                        .split(".")[0],
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                  const Text(
                    "°",
                    style: TextStyle(
                        color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
