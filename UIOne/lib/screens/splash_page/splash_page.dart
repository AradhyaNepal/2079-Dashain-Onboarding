import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_one/data/models/on_boarding_model.dart';
import 'package:ui_one/data/services/assets_location.dart';
import 'package:ui_one/screens/splash_page/widgets/onboarding_widget.dart';

class SplashPage extends StatefulWidget {
  static const route="/";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final PageController pageController=PageController();
  int pageIndex=1;
  final List<OnBoardingModel> onBoardingList=[
    OnBoardingModel(image: AssetsLocation.onBoarding1, heading: "Gülçehre İbrik Limited Edition", subText: "HISTORY CULTURE GLASS", priceEuro: 5650),
    OnBoardingModel(image: AssetsLocation.onBoarding2, heading: "Hagia Sophia Deesis Mosaic Vase", imageAtTop:false,subText: "HISTORY CULTURE GLASS", priceEuro: 3450),
    OnBoardingModel(image: AssetsLocation.onBoarding3, heading: "Mystical Vase Limited Edition", subText: "HISTORY CULTURE GLASS", priceEuro: 3150),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [

                SmoothPageIndicator(
                  effect: JumpingDotEffect(
                    dotHeight: 7,
                    dotWidth: 7,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.orange
                  ),

                  count: 3,
                  controller: pageController,

                ),
                Expanded(
                  child: PageView(
                    onPageChanged: (value){
                      setState(() {
                        pageIndex=value;
                      });
                    },
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for (int i =0;i<onBoardingList.length;i++)
                        OnBoardingWidget(
                          data: onBoardingList[i],
                        ),
                    ],
                  ),

                ),
                pageIndex==2?ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                        border:Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    height: 40,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        onPressed: (){

                        },
                        child: Text(
                            "SIGN IN"
                        )
                    ),
                  ),
                ):SizedBox(),
                SizedBox(height: pageIndex==2?10:0,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFD7A324),
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          )
                      ),
                        onPressed: (){
                          if(pageIndex!=2){
                            pageController.nextPage(duration: Duration(milliseconds: 500),curve: Curves.easeIn);
                          }
                        },
                        child: Text(pageIndex==2?"CREATE ACCOUNT":"NEXT")
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
