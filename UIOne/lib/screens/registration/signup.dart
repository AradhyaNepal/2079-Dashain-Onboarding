import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_one/data/services/assets_location.dart';
import 'package:ui_one/screens/registration/login.dart';
import 'package:ui_one/screens/splash_page/splash_page.dart';

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
                                          return "Please Enter UserName";
                                        }
                                        if(value.length<=5){
                                          return "Must be greater than 5 characters ";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
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
                                        if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                          return "Please Enter Valid Email";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Email",

                                      ),
                                    ),
                                    PasswordField(
                                      nextFocus: focusNode,
                                      validateMoreThanEmpty: true,
                                    ),
                                    TextFormField(
                                      focusNode: focusNode,
                                      textInputAction:TextInputAction.done,
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
                                    GoogleWidget(size: size),

                                    SizedBox(height: 10,),
                                    FacebookWidget(size: size),
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

class FacebookWidget extends StatelessWidget {
  const FacebookWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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

class GoogleWidget extends StatelessWidget {
  const GoogleWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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

class PasswordField extends StatefulWidget {
  final FocusNode? nextFocus;
  final bool next;
  final bool validateMoreThanEmpty;
  const PasswordField({
    this.validateMoreThanEmpty=false,
    this.next=true,
    this.nextFocus,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onFieldSubmitted: (_){
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
      textInputAction:widget.next?TextInputAction.next:TextInputAction.done,
      obscureText: !passwordVisible,
      decoration: InputDecoration(
          labelText: "Password",
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 15), // add padding to adjust icon
          child: IconButton(
            onPressed: (){
              setState(() {
                passwordVisible=!passwordVisible;
              });
            },
              icon: Icon(passwordVisible?Icons.visibility_off:Icons.visibility)
          ),
        ),
      ),
    );
  }
}
