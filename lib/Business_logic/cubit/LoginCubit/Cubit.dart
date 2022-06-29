import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Business_logic/cubit/LoginCubit/State.dart';
import 'package:shop/Data/repository/Login.dart';

import '../../../Modal/Login.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);
  late Login login;

  void PostDatawithLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    LoginRepostiry.PostDatawhenLogin(email: email, password: password)
        .then((value) {
      login = Login.fromJson(value.data);
      print(value.data);
      print(login.data!.phone);
      print(login.status);
      print(login.message);
      emit(LoginSuccessState(login));
    }).catchError((error) {
      //print(error.toString());
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void checkvisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(PasswordObscureText());
  }
}
