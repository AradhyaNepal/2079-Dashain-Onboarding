
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          data.imageAtTop?SizedBox():
          Column(
            children: [
              SizedBox(height: 25,),
              Text(
                data.subText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  data.heading,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,

                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "€"+data.priceEuro.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ],
          ),
          SizedBox(
            child: Image.asset(
                data.image
            ),
          ),
          data.imageAtTop?Column(
            children: [
              SizedBox(height: 5,),
              Text(
                "€"+data.priceEuro.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
              Text(
                data.subText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  data.heading,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,

                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ):SizedBox(),


        ],
      ),
    );
  }
}
