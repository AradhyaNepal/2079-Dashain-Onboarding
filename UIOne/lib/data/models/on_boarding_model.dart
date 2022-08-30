class OnBoardingModel{
  String image,heading,subText;
  int priceEuro;
  bool imageAtTop;
  OnBoardingModel({
    required this.image,
    required this.heading,
    required this.subText,
    required this.priceEuro,
    this.imageAtTop=true
  });
}