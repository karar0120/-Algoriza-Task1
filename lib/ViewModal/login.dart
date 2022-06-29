import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/Business_logic/cubit/LoginCubit/Cubit.dart';
import 'package:shop/Data/repository/Login.dart';

class loginViewModal {
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();

  void PostDataWithLogin(context) {
    LoginCubit.get(context).PostDatawithLogin(
        email: EmailController.text, password: PasswordController.text);
  }
  IconData cheakSuffixIcon(context){
    return LoginCubit.get(context).suffix;
  }
  bool cheakChangeButton(context){
   return LoginCubit.get(context).isPassword;
  }

  void checkvisibility(context) {
    LoginCubit.get(context).checkvisibility();
  }


  var golbalkey=GlobalKey<FormState>();

}
