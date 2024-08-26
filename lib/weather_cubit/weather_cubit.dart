import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_application/models/end_points.dart';
import 'package:weather_application/models/weather_model.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  SharedPreferences? sharedPreferences;
  Dio dio = Dio();
  WeatherCubit() : super(WeatherInitial());
  TextEditingController textEditingController = TextEditingController();
  getWeather({required String city}) async {
    try {
      emit(WeatherLoadingState());
      final response = await dio.get(EndPoints.foreCast, queryParameters: {
        "q": city,
        "days": "8",
      });

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      emit(
        WeatherSuccessState(
          weatherModel: weatherModel,
        ),
      );
      return weatherModel;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          emit(
            WeatherFailureState(),
          );
        case DioExceptionType.sendTimeout:
          emit(
            WeatherFailureState(),
          );
        case DioExceptionType.receiveTimeout:
          emit(
            WeatherFailureState(),
          );
        case DioExceptionType.badCertificate:
          emit(
            WeatherFailureState(),
          );
        case DioExceptionType.cancel:
          emit(
            WeatherFailureState(),
          );
        case DioExceptionType.connectionError:
          emit(
            WeatherFailureState(),
          );
        case DioExceptionType.unknown:
          emit(
            WeatherFailureState(),
          );
          emit(
            WeatherFailureState(),
          );
        case DioExceptionType.badResponse:
          emit(
            WeatherFailureState(),
          );
      }
    }
  }
}
