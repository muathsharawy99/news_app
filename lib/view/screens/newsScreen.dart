import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/view_model/bloc/newsBloc/newsCubit.dart';
import 'package:news/view_model/bloc/newsBloc/newsState.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<NewsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.turn_left_outlined,
                size: 30.w,
              ),
            ),
            title: Text("${cubit.layouts[cubit.currentIndex]} News",style: TextStyle(fontSize: 18.sp),),
            actions: [
              Center(
                  child: InkWell(
                onTap: () {cubit.changCountry(context);},
                child: Container(width: 35.w,height: 30.w,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                    child: Text(
                      cubit.text??"EN",
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )),
              Padding(padding: EdgeInsets.all(5.w))
            ],
          ),
          body: cubit.layouts[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cubit.setCurrentIndex(value);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                  label: "Sport",
                  icon: Icon(Icons.sports),
                ),
                BottomNavigationBarItem(
                  label: "Science",
                  icon: Icon(Icons.science_rounded),
                ),
                BottomNavigationBarItem(
                  label: "Technology",
                  icon: Icon(Icons.apple),
                ),
              ]),
        );
      },
    );
  }
}
