import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/view/screens/loginScreen.dart';
import 'package:news/view/screens/newsScreen.dart';
import 'package:news/view_model/local/sharedPreference.dart';
import 'package:news/view_model/local/sharedPreferenceKey.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.slideTransition,
      nextScreen:
          (SharedPreference.get(login) ?? false ) ? NewsScreen() : LoginScreen(),
      splash: Container(
        padding: EdgeInsetsDirectional.all(200.w),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            width: 3.w,
            color: Colors.white,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          size: 200.w,
        ),
      ),
      backgroundColor: Colors.blue,
      splashIconSize: 200.w,
      centered: true,
    );
  }
}
