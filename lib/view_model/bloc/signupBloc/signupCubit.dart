import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/view_model/bloc/signupBloc/signupState.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(PolicyInitState());

  static SignupCubit get(context) => BlocProvider.of<SignupCubit>(context);
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecure = true;
  bool checked = false;
  bool unChecked = true;
  var formKey = GlobalKey<FormState>();

  void checkPolicy() {
    unChecked = !unChecked;

    emit(PolicySelectedState());
  }

  void obsecurePassword() {
    obsecure = !obsecure;
    emit(ObsecurePassword());
  }
}
