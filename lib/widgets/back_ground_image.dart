import 'package:flutter/material.dart';
import 'package:weather_application/models/end_points.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      EndPoints.backGroundImage,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }
}
