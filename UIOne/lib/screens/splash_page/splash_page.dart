import 'package:flutter/material.dart';
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
    OnBoardingModel(image: AssetsLocation.onBoarding1, heading: "Gülçehre İbrik Limited Edition", subText: "History Culture glass", priceEuro: 5650),
    OnBoardingModel(image: AssetsLocation.onBoarding2, heading: "Hagia Sophia Deesis Mosaic Vase", subText: "History Culture glass", priceEuro: 3450),
    OnBoardingModel(image: AssetsLocation.onBoarding3, heading: "Mystical Vase Limited Edition", subText: "History Culture glass", priceEuro: 3150),
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
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [

              SmoothPageIndicator(
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
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width*0.6,
                  child: ElevatedButton(
                      onPressed: (){

                      },
                      child: Text("SignUp")
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
                      onPressed: (){
                        if(pageController.page!=2){
                          pageController.nextPage(duration: Duration(milliseconds: 500),curve: Curves.easeIn);
                        }
                      },
                      child: Text("Next")
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
