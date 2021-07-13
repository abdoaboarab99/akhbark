import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void bottomNavTap(int index) {
    currentIndex = index;
    if (index == 0) {
      getBusiness();
    } else if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    if (business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '5d477e26952b4b27a9d5a6cfacea215c',
        },
      )
          .then((value) => {
                business = value.data['articles'],
                print(business[0]['title']),
                emit(
                  NewsGetBusinessSuccessState(),
                )
              })
          .catchError((error) {
        print(error.toString());
        emit(
          NewsGetBusinessErrorState(
            error.toString(),
          ),
        );
      });
    } else {
      emit(
        NewsGetBusinessSuccessState(),
      );
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '5d477e26952b4b27a9d5a6cfacea215c',
        },
      )
          .then((value) => {
                sports = value.data['articles'],
                print(sports[0]['title']),
                emit(
                  NewsGetSportsSuccessState(),
                )
              })
          .catchError((error) {
        print(error.toString());
        emit(
          NewsGetSportsErrorState(
            error.toString(),
          ),
        );
      });
    } else {
      emit(
        NewsGetSportsSuccessState(),
      );
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '5d477e26952b4b27a9d5a6cfacea215c',
        },
      )
          .then((value) => {
                science = value.data['articles'],
                print(science[0]['title']),
                emit(
                  NewsGetScienceSuccessState(),
                )
              })
          .catchError((error) {
        print(error.toString());
        emit(
          NewsGetScienceErrorState(
            error.toString(),
          ),
        );
      });
    } else {
      emit(
        NewsGetScienceSuccessState(),
      );
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '5d477e26952b4b27a9d5a6cfacea215c',
      },
    )
        .then((value) => {
              search = value.data['articles'],
              print(search[0]['title']),
              emit(
                NewsGetSearchSuccessState(),
              )
            })
        .catchError((error) {
      print(error.toString());
      emit(
        NewsGetSearchErrorState(
          error.toString(),
        ),
      );
    });
  }
}
