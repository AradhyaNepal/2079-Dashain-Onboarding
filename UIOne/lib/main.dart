import 'package:flutter/material.dart';
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
      ),
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route:(context)=>const SplashPage()
      },
    );
  }
}
