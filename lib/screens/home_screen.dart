import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/weather_cubit/weather_cubit.dart';
import 'package:weather_application/widgets/back_ground_image.dart';
import 'package:weather_application/widgets/three_days_forecast.dart';
import 'package:weather_application/widgets/times_of_day.dart';

import '../widgets/app_bar_home_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";
  // final WeatherModel weatherModel;
  const HomeScreen({
    super.key,
    // required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    final WeatherModel? weatherModel =
        ModalRoute.of(context)!.settings.arguments as WeatherModel?;
    return BlocBuilder<WeatherCubit, WeatherState>(
      //  bloc: WeatherCubit()..getWeather(),
      // listener: (context, state) {
      //
      // },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              const BackgroundImage(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      const AppBarHomeScreen(),
                      Text(
                        weatherModel!.location!.name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Adaptive.h(5),
                          ),
                          Text(
                            weatherModel.current!.tempC!
                                .toString()
                                .split(".")[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 80,
                            ),
                          ),
                          const Text(
                            "°",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        "https:${weatherModel.current!.condition!.icon}",
                        height: 50,
                      ),
                      SizedBox(
                        height: Adaptive.h(1),
                      ),
                      Text(
                        weatherModel.current!.condition!.text.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                       SizedBox(
                        height: Adaptive.h(3),
                      ),
                      TimesOfDay(weatherModel: weatherModel),
                       SizedBox(
                        height: Adaptive.h(2.5),
                      ),
                       Row(
                        children: [
                          SizedBox(
                            width: Adaptive.w(6.2),
                          ),
                         const Text(
                            "THREE DAYS FORECAST",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      ThreeDaysForeCast(weatherModel: weatherModel),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
