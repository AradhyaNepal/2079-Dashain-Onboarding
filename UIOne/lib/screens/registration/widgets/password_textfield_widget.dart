
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final FocusNode? nextFocus;
  final FocusNode? currentFocus;
  final bool next;
  final bool validateMoreThanEmpty;
  final bool confirmPassword;
  const PasswordField({
    this.currentFocus,
    this.validateMoreThanEmpty=false,
    this.next=true,
    this.nextFocus,
    this.confirmPassword=false,
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
      focusNode: widget.currentFocus,
      maxLength: 30,
      validator: (value){
        if(value!.isEmpty){
          return "Please Enter "+(widget.confirmPassword?"Confirm Password":"Password");
        }
        if(widget.validateMoreThanEmpty){
          if(value.length<8){
            return "Password Must be 8 digit long";
          }
          if(!RegExp(r'[a-z]+').hasMatch(value)){
            return "Password must have 1 Small Digit";
          }
          if(!RegExp(r'[A-Z]+').hasMatch(value)){
            return "Password must have 1 Big Digit";
          }
          if(!RegExp(r'[0-9]+').hasMatch(value)){
            return "Password must have 1 number";
          }
          if(!RegExp(r'[^a-zA-Z0-9]+').hasMatch(value)){
            return "Password must have 1 special character";
          }
        }
        return null;
      },
      onFieldSubmitted: (_){
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
      textInputAction:widget.next?TextInputAction.next:TextInputAction.done,
      obscureText: !passwordVisible,

      decoration: InputDecoration(

        counterText: "",
        labelText: widget.confirmPassword?"Confirm Password":"Password",
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 15), // add padding to adjust icon
          child: SizedBox(
            width: widget.validateMoreThanEmpty?80:40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.validateMoreThanEmpty?
                Tooltip(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.9),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  showDuration: Duration(milliseconds: 2500),
                  triggerMode: TooltipTriggerMode.tap,
                  message: "8-30 Digits\n1 Capital\n1 Small\n1 Digit\n1 Special Character",
                  child: Icon(
                      Icons.info
                  ),
                ):
                SizedBox(),
                IconButton(

                    onPressed: (){
                      setState(() {
                        passwordVisible=!passwordVisible;
                      });
                    },
                    icon: Icon(
                        passwordVisible?Icons.visibility_off:Icons.visibility
                    ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
