

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/modules/Science/Scinece_Screen.dart';
import 'package:untitled/modules/business/Business.dart';
import 'package:untitled/modules/settingScreen/settingScreen.dart';
import 'package:untitled/modules/sports/Sport_Screen.dart';

part 'cubit_state.dart';

class NewsCubit extends Cubit<state> {
  NewsCubit() : super(Initial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens=[
    Business_Screen(),
    Science_Screen(),
    Sport_Screen(),
    SettingScreen()
  ];

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Businees'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Scinecs'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),

  ];
  void changeBottomNavBar(int index){
     currentIndex=index;
     emit(NewsBottomNafState() );
  }

}
