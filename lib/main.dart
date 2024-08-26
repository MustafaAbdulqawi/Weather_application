import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/screens/home_screen.dart';
import 'package:weather_application/screens/search_screen.dart';
import 'package:weather_application/screens/splash_screen.dart';
import 'package:weather_application/weather_cubit/weather_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'helper/cache_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routes: {
              SplashScreen.id: (context) => const SplashScreen(),
              HomeScreen.id: (context) => const HomeScreen(),
              SearchScreen.id: (context) => const SearchScreen(),
            },
            initialRoute: SplashScreen.id,
          );
        },
      ),
    );
  }
}
