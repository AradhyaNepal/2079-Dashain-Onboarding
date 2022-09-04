import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_one/screens/registration/login.dart';
import 'package:ui_one/screens/registration/signup.dart';
import 'package:ui_one/screens/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UIOne',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.light().copyWith(primary:Color(0xffCC9D76),secondary: Colors.orange),
      ),
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route:(context)=>const SplashPage(),
        SignupPage.route:(context)=> SignupPage(),
        LoginPage.route:(context)=> LoginPage(),
      },
    );
  }
}
