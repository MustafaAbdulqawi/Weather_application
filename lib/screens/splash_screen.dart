import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_application/models/error_model.dart';
import 'package:weather_application/screens/home_screen.dart';
import 'package:weather_application/weather_cubit/weather_cubit.dart';

import '../widgets/back_ground_image.dart';

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";
  const SplashScreen({super.key, this.errorModel});
  final ErrorModel? errorModel;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? sharedPreferences;
  String initCityName = "Cairo";

  @override
  void initState() {
    super.initState();
    _loadCityFromSharedPreferences();
  }

  Future<void> _loadCityFromSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final cityName = sharedPreferences?.getString('cityName');
    if (cityName != null && cityName.isNotEmpty) {
      setState(() {
        initCityName = cityName;
      });
    }
    await _gettingWeatherFromApi();
    //   ErrorModel errorModel;
  }

  String errorText = "Loading...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) async {
          if (state is WeatherSuccessState) {
            delayedWidget();
            await Navigator.pushReplacementNamed(context, HomeScreen.id,
                arguments: state.weatherModel);
          } else if (state is WeatherFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Try to connect to the internet"),
              ),
            );
            errorText = "Try again";
          } else {
           const CircularProgressIndicator();
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              const BackgroundImage(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      errorText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  delayedWidget() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _gettingWeatherFromApi() async {
    await BlocProvider.of<WeatherCubit>(context).getWeather(city: initCityName);
  }
}
