
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_one/data/services/assets_location.dart';

class FacebookWidget extends StatelessWidget {
  const FacebookWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return InkWell(
      onTap: (){},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.blue)
          ),
          width: size.width*0.75,
          child: Row(
            children: [
              Expanded(
                flex:2,
                child: SvgPicture.asset(
                    AssetsLocation.facebookLogo
                ),
              ),
              SizedBox(width: 15,),
              Spacer(),
              Text(
                "Continue with Facebook",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600
                ),
              ),
              Spacer(),
              SizedBox(width: 15,),
            ],
          ),
        ),
      ),
    );
  }
}