part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {

}
