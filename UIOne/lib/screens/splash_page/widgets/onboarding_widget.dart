
import 'package:flutter/material.dart';
import 'package:ui_one/data/models/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel data;
  const OnBoardingWidget({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(data.heading),
        Text(data.subText),
        Image.asset(data.image),
      ],
    );
  }
}
