import 'package:flutter/material.dart';
import 'package:ui_one/screens/registration/signup.dart';
import 'package:ui_one/screens/registration/widgets/facebook_widget.dart';
import 'package:ui_one/screens/registration/widgets/password_textfield_widget.dart';
import 'package:ui_one/screens/splash_page/splash_page.dart';

import 'widgets/google_widget.dart';

class LoginPage extends StatelessWidget {
  static const String route="LoginRoute";
  final GlobalKey<FormState> formKey=GlobalKey();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{

        Navigator.pushReplacementNamed(context, SplashPage.route,arguments: true);
        return false;
      },
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SplashPage.route,arguments: true);
                    },
                    child: Icon(
                      Icons.arrow_back
                    ),
                  ),
                  Spacer(),
                  Text(
                    "LOG IN",
                    style: TextStyle(
                      color: Colors.white,

                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            body:Container(
              height: size.height,
              color: Colors.black,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  )
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        "Let's Sign You In",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "Welcome back, you've been missed!",
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                      SizedBox(height: 20,),
                      Form(
                        key: formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 25,),
                              TextFormField(
                                textInputAction:TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: "Username"
                                ),
                              ),
                              SizedBox(height: 10,),
                              PasswordField(next: false,),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  RememberMeWidget(),
                                  Spacer(),
                                  TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: (){},
                                      child: Text(
                                          "Forgot Password?",
                                        style: TextStyle(
                                            color: Colors.black
                                        ),
                                      )
                                  )
                                ],
                              ),
                              SizedBox(height: 15,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: SizedBox(
                                  width: size.width*0.75,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                                    onPressed: (){

                                    },
                                    child: Text(
                                      "SIGN IN"
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 30,),
                              GoogleWidget(),
                              SizedBox(height: 10,),
                              FacebookWidget(),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    "Don't have an account?"
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pushReplacementNamed(context, SignupPage.route);
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                  Spacer(),

                                ],
                              ),

                              SizedBox(height: 20,),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ) ,
          )
      ),
    );
  }
}

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool checked=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        checked=!checked;
        setState(() {

        });
      },
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(

                value: checked, onChanged: (value){
              setState(() {
                checked=value??!checked;
              });
            }),
          ),
          SizedBox(width: 10,),
          Text(
              "Remember Me",
          )
        ],
      ),
    );
  }
}
