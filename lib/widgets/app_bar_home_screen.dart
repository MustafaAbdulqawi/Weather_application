import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/search_screen.dart';

class AppBarHomeScreen extends StatelessWidget {
  const AppBarHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
            size: 34,
          ),
        ),
        IconButton(
          onPressed: () async {
            // await context.read<WeatherCubit>().getWeather();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 34,
          ),
        ),
      ],
    );
  }
}
