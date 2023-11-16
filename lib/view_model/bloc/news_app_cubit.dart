import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/view/screens/bussines_section/bussines_screen.dart';
import 'package:newsapp/view/screens/science_section/science_screen.dart';
import 'package:newsapp/view/screens/settings_section/settings_screen.dart';
import 'package:newsapp/view/screens/sports_section/sports_screen.dart';
import 'package:newsapp/view_model/network/local/shared_keys.dart';
import 'package:newsapp/view_model/network/local/shared_preference.dart';
import 'package:newsapp/view_model/network/remote/constants.dart';
import 'package:newsapp/view_model/network/remote/dio_helper.dart';

part 'news_app_state.dart';

class NewsAppCubit extends Cubit<NewsAppState> {
  NewsAppCubit() : super(NewsAppInitial());

  static NewsAppCubit get(context) => BlocProvider.of<NewsAppCubit>(context);

  int currentIndex = 0;
  List<String> titleList = [
    "Business News",
    "Sports News",
    "Science News",
    "Settings News",
  ];
  List<Widget> screenList = [
    const BusinessSection(),
    const SportsSection(),
    const ScienceSection(),
    const SettingsSection(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center_outlined,
      ),
      label: "Business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball_outlined,
      ),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
      ),
      label: "Science",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: "Settings",
    ),
  ];

  void changeIndex(int index) {
    //el ifat dy 3slahn lama ados 3ala 1 yegbly el data
    currentIndex = index;
    emit(ChangeIndex());
    if (index == 1) {
      getSportsNew();
    }
    if (index == 2) {
      getScienceNew();
    }
  }

  List<Articles> articlesListForBusiness = [];

  void getBusinessNew() {
    //awel ma afta7 lazzem a3ml emit le el loading
    emit(LoadingBusinessNews());
    DioHelper.getData(
      path: EndPoints.NEWS_ENDPOINT,
      query: EndPoints.newsQueryBusiness, // el query mehtag map
    ).then(
      (value) {
        final List<dynamic> businessJsonData = value.data["articles"];
        articlesListForBusiness = businessJsonData
            .map((articleData) => Articles.fromJson(articleData))
            .toList();
        emit(GetBusinessNewsSuccess());
      },
    ).catchError(
      (onError) {
        emit(GetBusinessNewsError(onError.toString()));
      },
    );
  }

  List<Articles> articlesListForSports = [];

  void getSportsNew() {
    emit(LoadingSportsNews());
    //el if dy 3lshan lw hya empty yegbly el data
    //lw msh empty emit el succes bas
    if (articlesListForSports.isEmpty) {
      DioHelper.getData(
        path: EndPoints.NEWS_ENDPOINT,
        query: EndPoints.newsQuerySports,
      ).then(
        (value) {
          final List<dynamic> sportsJsonData = value.data["articles"];
          articlesListForSports = sportsJsonData
              .map((articleData) => Articles.fromJson(articleData))
              .toList();
          emit(GetSportsNewsSuccess());
        },
      ).catchError(
        (onError) {
          emit(GetSportsNewsError(onError.toString()));
        },
      );
    } else {
      emit(GetSportsNewsSuccess());
    }
  }

  List<Articles> articlesListForScience = [];

  void getScienceNew() {
    //awel ma afta7 lazzem a3ml emit le el loading
    emit(LoadingScienceNews());

    if (articlesListForScience.isEmpty) {
      DioHelper.getData(
        path: EndPoints.NEWS_ENDPOINT,
        query: EndPoints.newsQueryScience, // el query mehtag map
      ).then(
        (value) {
          final List<dynamic> scienceJsonData = value.data["articles"];
          //articleData is expected to be a Map<String, dynamic>
          for (var articleData in scienceJsonData) {
            articlesListForScience.add(Articles.fromJson(articleData));
          }
          emit(GetScienceNewsSuccess());
        },
      ).catchError(
        (onError) {
          emit(GetScienceNewsError(onError.toString()));
        },
      );
    } else {
      emit(GetScienceNewsSuccess());
    }
  }

  bool isDark = SharedPreference.get(key: SharedKeys.isDark) ?? false;

  void changeTheme() {
    isDark = !isDark;
    SharedPreference.set(key: SharedKeys.isDark, value: isDark);
    emit(ChangeThemeColorState());
  }

  bool isChanged =
      SharedPreference.get(key: SharedKeys.isChangedWidget) ?? true;

  void changeWidgetStyle() {
    isChanged = !isChanged;
    SharedPreference.set(key: SharedKeys.isChangedWidget, value: isChanged);
    emit(ChangeWidgetStyleState());
  }

  // search for
/*  static const Map<String, dynamic> searchQuery = {
    "q": "tesla",
    "apiKey": apikey,
  };*/

  TextEditingController searchController = TextEditingController();
  List<Articles> articlesListForSearch = [];

  void search(String searchQuery) {
    emit(LoadingSearchState());
    DioHelper.getData(
      path: EndPoints.SEARCH_ENDPOINT,
      query: {
        "q": searchQuery,
        "apiKey": EndPoints.apikey,
      }, // el query mehtag map
    ).then(
      (value) {
        final List<dynamic> searchJsonData = value.data["articles"];
        articlesListForSearch = searchJsonData
            .map((articleData) => Articles.fromJson(articleData))
            .toList();
        emit(GetSearchNewsSuccess());
      },
    ).catchError(
      (onError) {
        emit(GetSearchNewsError(onError));
      },
    );
  }
}
