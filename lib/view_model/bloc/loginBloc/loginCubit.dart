import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/view_model/bloc/loginBloc/loginState.dart';
import 'package:news/view_model/local/sharedPreference.dart';
import 'package:news/view_model/local/sharedPreferenceKey.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginInitState());
  var formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool errorUser = false;
  bool errorPassword = false;
  bool obsecure = true;

  static LoginScreenCubit get(context) =>
      BlocProvider.of<LoginScreenCubit>(context);

  void showPassword() {
    obsecure = !obsecure;
    emit(ShowPasswordState());
  }

  void errorUserValue() {
    errorUser = true;
    emit(ErrorUserValueState());
  }

  void errorPasswordValue() {
    errorPassword = true;
    emit(ErrorPasswordValueState());
  }

  void checkLogin() {
    emit(CheckLoginLoadingState());
    Future.delayed(Duration(seconds: 1), () {
      if (usernameController.text == "Muath" &&
          passwordController.text == "Hi") {
        SharedPreference.set(login, true);
        emit(CheckLoginSuccessState());
      } else {
        emit(CheckLoginErrorState("Invalid email or password"));
      }
    });
  }

}
