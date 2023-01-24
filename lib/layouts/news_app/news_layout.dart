

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layouts/news_app/cubit_cubit.dart';
import 'package:untitled/shared/networks/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context)=> NewsCubit(),
       child:BlocConsumer< NewsCubit,state>(
        builder: (BuildContext context, state  ) {
          var  cubit = NewsCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text("News App"),
                actions: [
                  IconButton(onPressed: (){}, icon:Icon(Icons.search,
                  size: 30.0,
                  ))
                ],
              ),
              floatingActionButton: FloatingActionButton(onPressed: () { 
                DioHelper.getData(url:'https://api.genderize.io',
                    query:{
                  'name':'luc',
                    }
                ).then((value) =>print(value.data.toString())).catchError(
                        (error){
                          print(error.toString());
                        });
              },
                child:Icon(Icons.add) ,

              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar:  BottomNavigationBar(
                items:cubit.bottomItem,
                currentIndex: cubit.currentIndex,
                onTap: (index){
                           cubit.changeBottomNavBar(index);
                },
              )
          );
    },
        listener: (BuildContext context, Object? state) {  },

    ),
    );
  }
}
