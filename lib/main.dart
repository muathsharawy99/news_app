import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/restart.dart';
import 'package:news/view/screens/splashScreen.dart';
import 'package:news/view_model/bloc/newsBloc/newsCubit.dart';
import 'package:news/view_model/bloc/signupBloc/signupCubit.dart';
import 'view_model/bloc/blocObserver/observer.dart';
import 'view_model/bloc/loginBloc/loginCubit.dart';
import 'view_model/local/sharedPreference.dart';
import 'view_model/network/dioHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.initShared();
  Bloc.observer = MyBlocObserver();
  await DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginScreenCubit(),
          ),
          BlocProvider(
            create: (context) => SignupCubit(),
          ),
          BlocProvider(
            create: (context) => NewsCubit()
              ..getSportsNews()
              ..getScienceNews()
              ..getTechNews()..setCountryEgypt(),
          )
        ],
        child: ScreenUtilInit(
          designSize: Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
