
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_one/data/services/assets_location.dart';

class GoogleWidget extends StatelessWidget {
  const GoogleWidget({
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
              border: Border.all(color: Colors.red)
          ),
          width: size.width*0.75,
          child: Row(
            children: [
              Expanded(
                child: SvgPicture.asset(
                    AssetsLocation.googleLogo
                ),
              ),
              Spacer(),
              Text(
                "Continue with Google",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.w600
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
