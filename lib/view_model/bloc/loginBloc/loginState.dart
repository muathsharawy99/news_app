abstract class LoginScreenState {}

class LoginInitState extends LoginScreenState {}
class LoginLoadingState extends LoginScreenState {}
class LoginSuccessState extends LoginScreenState {}
class LoginErrorState extends LoginScreenState {}

class ShowPasswordState extends LoginScreenState{}
class ErrorUserValueState extends LoginScreenState{}
class ErrorPasswordValueState extends LoginScreenState{}


class CheckLoginLoadingState extends LoginScreenState{}
class CheckLoginSuccessState extends LoginScreenState{}
class CheckLoginErrorState extends LoginScreenState{
  String error;
  CheckLoginErrorState(this.error);
}
