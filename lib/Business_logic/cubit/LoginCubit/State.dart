import '../../../Modal/Login.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final Login login;
  LoginSuccessState(this.login);
}

class LoginErrorState extends LoginState {
  final  error;

  LoginErrorState(this.error);
}
class PasswordObscureText extends LoginState {}