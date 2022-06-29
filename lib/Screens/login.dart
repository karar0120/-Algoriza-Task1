// ignore_for_file: prefer_const_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shop/Business_logic/cubit/LoginCubit/Cubit.dart';
import 'package:shop/Business_logic/cubit/LoginCubit/State.dart';
import 'package:shop/Constaness/constanesApp.dart';

import 'package:shop/SharedPref/shared_preferences.dart';
import 'package:shop/ViewModal/login.dart';
import 'Register.dart';

class Login extends StatelessWidget {
  @override
  var LoginViewModal = loginViewModal();

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              // appBar: AppBar(
              //   backgroundColor: Colors.white,
              //   elevation: 0.0,
              // ),
              body: SafeArea(child: GetBody(context, state)),
            );
          },
        ));
  }

  Widget GetBody(context, state) {
     List<String> _allCountriesForPhoneInput = ["AE", "EG", "SA"];
    var PhoneController=TextEditingController();
    return Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Image.network("https://i.pinimg.com/564x/d1/6c/18/d16c180e87d46ac8393d20725ed34853.jpg"),
            Container(
              height: 500,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: LoginViewModal.golbalkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Sign In',
                            style: TextStyle(fontSize: 34),
                          ),
                          MakeTextButton(
                              onPreseed: () {
                                NavigatorPush(context, Register());
                              },
                              text: "help"),
                        ],
                      ),
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
                        textFieldController:PhoneController ,
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
                      // MakeTextFormField(
                      //     controller: LoginViewModal.EmailController,
                      //     labelText: "Email",
                      //     iconData: Icons.email_outlined,
                      //     textInputType: TextInputType.emailAddress,
                      //     validator: (Text) {
                      //       if (Text.isEmpty) {
                      //         return "please enter your email adders";
                      //       } else {
                      //         return null;
                      //       }
                      //     }),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // MakeTextFormField(
                      //     controller: LoginViewModal.PasswordController,
                      //     labelText: "Password",
                      //     iconData: Icons.lock_open_outlined,
                      //     textInputType: TextInputType.visiblePassword,
                      //     Iconsuffix: LoginViewModal.cheakSuffixIcon(context),
                      //     suffixPressed: () {
                      //       LoginViewModal.checkvisibility(context);
                      //     },
                      //     ObscureText: LoginViewModal.cheakChangeButton(context),
                      //     OnFieldSubmitted: (value) {
                      //       if (LoginViewModal.golbalkey.currentState!.validate()) {
                      //         LoginViewModal.PostDataWithLogin(context);
                      //       }
                      //     },
                      //     validator: (password) {
                      //       if (password.isEmpty) {
                      //         return "please enter your password";
                      //       } else {
                      //         return null;
                      //       }
                      //     }),
                      // SizedBox(
                      //   height: 30,
                      // ),

                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => MakeDafultButton(
                            onPressed: () {
                              if (LoginViewModal.golbalkey.currentState!
                                  .validate()) {
                                LoginViewModal.PostDataWithLogin(context);
                              }
                            },
                            text: "Sign In",
                            isuppuer: false)  ,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MakeDafultButton(
                          onPressed: () {
                            if (LoginViewModal.golbalkey.currentState!
                                .validate()) {
                              LoginViewModal.PostDataWithLogin(context);
                            }
                          },
                          text: "Sign In with google",
                          isuppuer: false)  ,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Doesn\'t has any account?'),
                          MakeTextButton(
                              onPreseed: () {
                                NavigatorPush(context, Register());
                              },
                              text: "Register Now")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
