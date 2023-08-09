import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/model/newsModel/newModel.dart';
import 'package:news/view/component/newsWidget/newsWidget.dart';
import 'package:news/view_model/bloc/newsBloc/newsCubit.dart';
import 'package:news/view_model/bloc/newsBloc/newsCubit.dart';
import 'package:news/view_model/bloc/newsBloc/newsState.dart';
import 'package:news/view_model/network/dioHelper.dart';

class Science extends StatelessWidget {
  Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(

      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 1.h,
            );
          },
          itemBuilder: (context, index) {
            return Center(
              child: NewsWidget(article:cubit.scienceNewsModel?.articles?[index] ?? Articles(),),
            );
          },
          itemCount: cubit.scienceNewsModel?.articles?.length ?? 0,
        );
      },
    );
  }
}
