import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/model/navigation/navigation.dart';
import 'package:news/view/screens/newsScreen.dart';
import 'package:news/view_model/bloc/loginBloc/loginCubit.dart';
import 'package:news/view_model/bloc/loginBloc/loginState.dart';
import 'signupScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreenCubit, LoginScreenState>(
      listener: (context, state) {
        if (state is CheckLoginSuccessState) {
          Navigation.goPushAndReplacement(context, NewsScreen());
        }
      },
      builder: (context, state) {
        var cubit = LoginScreenCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(
                          size: 150.w,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Login to your account",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        SizedBox(
                          width: 300.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.r),
                            elevation: 10.w,
                            shadowColor:
                                cubit.errorUser ? Colors.red : Colors.blue,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your username";
                                }
                                return null;
                              },
                              controller: cubit.usernameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Username",
                                border: InputBorder.none,
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2.w),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.w),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                contentPadding: EdgeInsetsDirectional.only(
                                    start: 10.w, top: 10.w),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.w),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 2.w,
                                  ),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                isDense: true,
                                prefixIcon: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 5.r,
                                          blurStyle: BlurStyle.outer),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person_2_outlined,
                                    size: 30.r,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 300.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.r),
                            elevation: 10.w,
                            shadowColor:
                                cubit.errorPassword ? Colors.red : Colors.blue,
                            child: TextFormField(
                                controller: cubit.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: cubit.obsecure,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.visibility,
                                          color: cubit.obsecure
                                              ? Colors.grey
                                              : Colors.blue),
                                      onPressed: () {
                                        cubit.showPassword();
                                      }),
                                  labelText: "Password",
                                  border: InputBorder.none,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.w),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.w),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  contentPadding: EdgeInsetsDirectional.only(
                                    start: 10.w,
                                    top: 10.w,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.w),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.w,
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  isDense: true,
                                  prefixStyle: TextStyle(),
                                  prefixIcon: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blue,
                                            blurRadius: 5.r,
                                            blurStyle: BlurStyle.outer),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.lock,
                                      size: 30.r,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter your password";
                                  }
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 40.h,
                          child:
                          ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.checkLogin();
                                }
                              },
                              child:
                              state is CheckLoginLoadingState? CircularProgressIndicator.adaptive():
                              Text("Sign in")),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 1.h,
                                thickness: 1.h,
                                color: Colors.blue,
                                indent: 25.w,
                              ),
                            ),
                            Text(
                              " Or Sign in with ",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1.h,
                                thickness: 1.h,
                                color: Colors.blue,
                                endIndent: 25.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(color: Colors.blue, blurRadius: 2.r)
                                  ]),
                              child: Image.asset(
                                "assets/google.png",
                                cacheWidth: 25,
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Container(
                              width: 50.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(color: Colors.blue, blurRadius: 2.r)
                                  ]),
                              child: Image.asset(
                                "assets/facebook.png",
                                cacheHeight: 25,
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Container(
                              width: 50.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(color: Colors.blue, blurRadius: 2.r
                                    )
                                  ]),
                              child: Image.asset(
                                "assets/twitter.webp",
                                cacheWidth: 25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigation.goPush(context, SignupScreen());
                                },
                                child: Text("Sign up here"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
