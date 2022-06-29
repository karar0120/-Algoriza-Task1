
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../Constaness/constanesApp.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _allCountriesForPhoneInput = ["AE", "EG", "SA"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(),
      body: Stack(
        children: [
           Image.network("https://i.pinimg.com/564x/d1/6c/18/d16c180e87d46ac8393d20725ed34853.jpg"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Fashion Daily ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 34),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MakeTextButton(
                      onPreseed: () {
                        NavigatorPush(context, Register());
                      },
                      text: "help"),
                ],
              ),


            MakeTextFormField(
                controller: TextEditingController(),
                labelText: "Email",
                iconData: Icons.email_outlined,
                textInputType: TextInputType.emailAddress,
                validator: (Text) {
                  if (Text.isEmpty) {
                    return "please enter your email adders";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 30,
            ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number);
                  // if (number?.phoneNumber==null) {
                  //
                  // } else {
                  //
                  // }
                },
                cursorColor: Colors.indigo,
                textStyle: const TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Almarai-Bold'),
                locale: 'en',
                ignoreBlank: true,
                formatInput: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 14,
                    fontFamily: 'Almarai-Bold'),
                textFieldController:TextEditingController() ,
                spaceBetweenSelectorAndTextField: 0,
                // inputBorder:InputBorder.none,
                countries:_allCountriesForPhoneInput,
                inputDecoration: InputDecoration(
                  //   border: InputBorder.none,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.phone),
                  contentPadding: const EdgeInsets.only(bottom: 8),
                  hintText: "Phone",
                  hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontFamily: 'Almarai-Bold'),
                  labelStyle: const TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 14,
                      fontFamily: 'Almarai-Bold'),
                  errorStyle:
                  TextStyle(color: Colors.red[300], fontSize: 11),
                  // border: noneInputBorder,
                  // errorBorder: InputBorder.none,
                  //focusedErrorBorder: InputBorder.none,
                  //disabledBorder: InputBorder.none,
                  //enabledBorder: InputBorder.none,
                  //focusedBorder: InputBorder.none
                ),
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    // setState(() {
                    //   _phoneValidator = true;
                    // });
                  } else {
                    // setState(() {
                    //   _phoneValidator = false;
                    // });
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
            MakeTextFormField(
                controller: TextEditingController(),
                labelText: "Password",
                iconData: Icons.lock_open_outlined,
                textInputType: TextInputType.visiblePassword,
                Iconsuffix: Icons.remove_red_eye,
                ObscureText:true,
                OnFieldSubmitted: (value) {
                },
                validator: (password) {
                  if (password.isEmpty) {
                    return "please enter your password";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 30,
            ),

              MakeDafultButton(
                  onPressed: () {

                  },
                  text: "Sign In",
                  isuppuer: false)  ,
              SizedBox(
                height: 15,
              ),
              MakeDafultButton(
                  onPressed: () {

                  },
                  text: "Sign In with google",
                  isuppuer: false)  ,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Has any account ?'),
                  MakeTextButton(
                      onPreseed: () {
                       // NavigatorPush(context, Register());
                      },
                      text: "Sign in here")
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
