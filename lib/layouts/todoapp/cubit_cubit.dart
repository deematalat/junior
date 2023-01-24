import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/archive_tasks/archive_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';
part 'cubit_state.dart';

class AppCubit extends Cubit<AppState> {

 AppCubit() : super(Initial());
   static AppCubit get(context) => BlocProvider.of(context);
 List<Map> newTasks=[];
 List<Map> doneTasks=[];
 List<Map> archiveTasks=[];
   int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];
  List titles=[
    'New tasks',
    'Done tasks',
    'archive tasks',
  ];
 Database? database;
void changeIndex(int index){
  currentIndex=index;
  emit(BottomNAFState());
}
 void creatDataBase()  {
    openDatabase(
     'database.db',
     version: 1,
     onCreate: (database, version) {
       print("creat data base");
       return database
           .execute(
         'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, '
             ' time TEXT ,date TEXT,satuts TEXT )',
       )
           .then((value) => print("creat table "))
           .catchError((error) {
         print("${error.toString()}");
       });
     },
     onOpen: (database) {
       getDataBase(database).then((value) {
         newTasks = value;
        print(newTasks );
        emit(Getdb());
       });
       print("open data base");
     },
   ).then((value) { database=value;
                emit(AppCreatedb());
   }
    );
 }

   insertDataBase({
   required String title,
   required String time,
   required String date,
 }) async {
    await database!.transaction((txn) => txn
       .rawInsert('INSERT INTO tasks( title ,time,date,satuts  )'
       ' VALUES("$title","$time","$date","new")')
       .then((value) {
      print("$value successfully incert");
      emit(AppInseartdb());
      getDataBase(database);
    }).
     catchError((error) {
     print('${error.toString()}');
   }));
 }

 Future<List<Map>> getDataBase( database) async {

   return await database.rawQuery('SELECT * FROM tasks');

}/*.then((value) {
     newTasks = value;
     print(newTasks);
     value.forEach((element){
       if(element['satuts']=='new')
           newTasks.add( element);
       else if(element['satuts']=='done')
         doneTasks.add( element);
       else  archiveTasks.add( element);

     });
     emit(Getdb());
   });*/

 void updateData(
 {
  required String satuts,
  required int id
}
     )async {
   await database!.rawUpdate(
       'UPDATE tasks SET  satuts = ?, WHERE  id = ?',
       ['updated  $satuts', '$id']).then((value) {
     getDataBase(database).then((value) {
       newTasks = [];
       doneTasks = [];
       archiveTasks = [];
       newTasks = value;
       value.forEach((element) {
         if (element['satuts'] == 'new')
           newTasks.add(element);
         else if (element['satuts'] == 'done')
           doneTasks.add(element);
         else
           archiveTasks.add(element);
       }

       );
       emit(AppUpdatedb());
     });
   });
 }

 void deleteData(
     {
       required int id
     }
     )async {
   await database!.rawDelete('DELETE FROM tasks WHERE  id = ?', [id]).then((value) {
     getDataBase(database);
     emit( AppDeletedb());
   });



 }
 bool isBottomSheetShown = false;
 IconData fabicon = Icons.edit;
 void changeBottomSheetState({
     required bool isShow,
    required IconData icon,
 }
     ){
       isBottomSheetShown=isShow;
       fabicon=icon;
       emit(BottomSheetState());
 }
}



