import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/newsModel/newModel.dart';
import 'package:news/view/layouts/scienceLayout.dart';
import 'package:news/view/layouts/sportsLayout.dart';
import 'package:news/view/layouts/techLayout.dart';
import 'package:news/view_model/bloc/newsBloc/newsState.dart';
import 'package:news/view_model/local/sharedPreference.dart';
import 'package:news/view_model/local/sharedPreferenceKey.dart';
import 'package:news/view_model/network/dioHelper.dart';
import 'package:news/view_model/network/endPoints.dart';

import '../../../restart.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitState());

  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);
  NewsModel? scienceNewsModel;
  NewsModel? sportsNewsModel;
  NewsModel? techNewsModel;
  String? text;

  List<Widget> layouts = [Sports(), Science(), Technology()];
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeLayoutIndex());
  }

  void setCountryEgypt(){
    emit(SetCountryEgyLoadingState());
    SharedPreference.set(country, true);
    emit(SetCountryEgySuccessState());
  }


  Future<void> getSportsNews() async {
    emit(GetSportsNewsLoading());
    await DioHelper.get(endPoint: topHeadlines, queryParams: {
      "apiKey": apiKey,
      "category": "sports",
      "country": (SharedPreference.get(country)==true??true)? "eg":"sa",
      "language": (SharedPreference.get(country)==true??true)?  "ar":"en"
    }).then((value) {
      sportsNewsModel = NewsModel.fromJson(value.data);
      emit(GetSportsNewsSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetSportsNewsError());
    });
  }

  Future<void> getScienceNews() async {
    emit(GetScienceNewsLoading());
    await DioHelper.get(endPoint: topHeadlines, queryParams: {
      "apikey": apiKey,
      "category": "science",
      "country": "eg",
      "language": "ar"
    }).then((value) {
      scienceNewsModel = NewsModel.fromJson(value.data);
      emit(GetScienceNewsSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetScienceNewsError());
    });
  }

  Future<void> getTechNews() async {
    emit(GetTechNewsLoading());
    await DioHelper.get(endPoint: topHeadlines, queryParams: {
      "apikey": apiKey,
      "category": "technology",
      "country": "eg",
      "language": "ar"
    }).then((value) {
      print(value.data.toString());
      techNewsModel = NewsModel.fromJson(value.data);
      // print(scienceNewsModel?.articles?.length ?? 0);
      emit(GetTechNewsSuccess());
    }).catchError((onError) {
      // print(onError.toString());
      emit(GetTechNewsError());
    });
  }

  String? changCountry(context) {
    emit(ChangeCountryLoadingState());
    SharedPreference.set(country, !SharedPreference.get(country));
    SharedPreference.get(country) == true ? text="EG" : text= "SA";
    // RestartWidget.restartApp(context);
    emit(ChangeCountrySuccessState());
    return text;
  }
}
