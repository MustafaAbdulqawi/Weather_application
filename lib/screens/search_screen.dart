import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_application/screens/home_screen.dart';
import 'package:weather_application/weather_cubit/weather_cubit.dart';
import 'package:weather_application/widgets/back_ground_image.dart';

import '../widgets/custom_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  static String id = "SearchScreen";
  const SearchScreen({super.key});

  Future<void> saveCityName(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cityName', cityName);
  }

  @override
  Widget build(BuildContext context) {
    final gettingWeatherCubit = context.read<WeatherCubit>();
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.id,
            (route) => false,
            arguments: state.weatherModel,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              const BackgroundImage(),
              ListView(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Search for your city",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(gettingWeatherCubit: gettingWeatherCubit),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        final city =
                            gettingWeatherCubit.textEditingController.text;
                        if (city.isNotEmpty) {
                          await saveCityName(city);
                          gettingWeatherCubit.getWeather(city: city);
                          gettingWeatherCubit.textEditingController.clear();
                        }
                      },
                      child: state is WeatherLoadingState
                          ? const CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: Colors.blue,
                            )
                          : const Text(
                              "Search",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
