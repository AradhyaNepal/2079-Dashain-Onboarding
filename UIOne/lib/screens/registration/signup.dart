import 'package:flutter/material.dart';
import 'package:ui_one/screens/registration/login.dart';
import 'package:ui_one/screens/splash_page/splash_page.dart';

import 'widgets/facebook_widget.dart';
import 'widgets/google_widget.dart';
import 'widgets/password_textfield_widget.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<FormState> formKey=GlobalKey();
  final focusNode=FocusNode();
  static const String route="Signup";
  SignupPage({Key? key}) : super(key: key);

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
                    "Register",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            body: Container(
              width: size.width,
              height: size.height,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Expanded(
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                      ),

                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Text(
                              'Create your account',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              'After your registration is complete,\n you can see our opportunity products.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      maxLength: 30,
                                      textInputAction:TextInputAction.next,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return "Please Enter User Name";
                                        }
                                        if(value.length<=5){
                                          return "Must be greater than 5 characters ";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        counterText: "",
                                        labelText: "Username",

                                      ),
                                    ),
                                    TextFormField(
                                      textInputAction:TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return "Please Enter Email";
                                        }
                                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                          return "Please Enter Valid Email";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Email",

                                      ),
                                    ),

                                    TextFormField(
                                      textInputAction:TextInputAction.next,
                                      keyboardType: TextInputType.phone,
                                      maxLength: 10,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return "Please Enter Phone";
                                        }
                                        if(value.length<10){
                                          return "Must be 10 digit long";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Phone",
                                          counterText: ""
                                      ),
                                    ),
                                    PasswordField(
                                      nextFocus: focusNode,
                                      validateMoreThanEmpty: true,
                                    ),
                                    PasswordField(
                                      currentFocus: focusNode,
                                      next: false,
                                      confirmPassword: true,
                                    ),
                                    SizedBox(height: 10,),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: SizedBox(
                                        width: size.width*0.75,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(primary: Colors.orange),
                                            onPressed: (){
                                              formKey.currentState!.validate();
                                            },
                                            child: Text(
                                              "SIGN UP"
                                            )
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30,),
                                    GoogleWidget(),

                                    SizedBox(height: 10,),
                                    FacebookWidget(),
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Spacer(),
                                        Text("Already Have Account?",),
                                        TextButton(
                                            onPressed:(){
                                              Navigator.pushReplacementNamed(context, LoginPage.route);
                                            },
                                            child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),)),
                                        Spacer(),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

