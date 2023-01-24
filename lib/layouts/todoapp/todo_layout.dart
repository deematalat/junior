
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/layouts/todoapp/cubit_cubit.dart';
import '../../shared/components/constants.dart';

class  toDoHomeScreen extends StatelessWidget {
  // Get a location using getDatabasesPath


  Database? database;
  var scaffoldKay = GlobalKey<ScaffoldState>();
  var formKay = GlobalKey<FormState>();

  var titleControler = TextEditingController();
  var dateControler = TextEditingController();
  var timeControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
        AppCubit()
          ..creatDataBase(),
        child: BlocConsumer <AppCubit, AppState>(
            listener: (context, state) {
              if(state is  AppInseartdb){
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return Scaffold(
                key: scaffoldKay,
                appBar: AppBar(
                  title: Text(
                    AppCubit
                        .get(context)
                        .titles[AppCubit
                        .get(context)
                        .currentIndex],
                  ),
                ),
                body: BuildCondition(
                  condition: true,
                  builder: (context) =>
                  AppCubit
                      .get(context)
                      .screens[ AppCubit
                      .get(context)
                      .currentIndex],
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    if (AppCubit.get(context).isBottomSheetShown) {
                      if (formKay.currentState!.validate()) {

                        AppCubit.get(context).insertDataBase(
                            title:titleControler.text,
                            time:  timeControler.text,
                            date: dateControler.text
                        );


                      }
                    } else {
                      scaffoldKay.currentState!
                          .showBottomSheet(
                            (context) =>
                            Container(
                              color: Colors.white,
                              padding: EdgeInsetsDirectional.all(20.0),
                              child: Form(
                                  key: formKay,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        defaultFormfelid(
                                          controller: titleControler,
                                          inputType: TextInputType.text,
                                          validate: (value) {
                                            if (value.isEmpty) {
                                              return "title must not be empty";
                                            }
                                            return null;
                                          },
                                          lebel: "tasks title",
                                          prefix: Icons.title,
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        defaultFormfelid(
                                            controller: timeControler,
                                            inputType: TextInputType.datetime,
                                            validate: (value) {
                                              if (value.isEmpty) {
                                                return "time must not be empty";
                                              }
                                              return null;
                                            },
                                            lebel: "tasks time",
                                            prefix: Icons.watch_later_outlined,
                                            onTap: () {
                                              showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                                  .then((value) {
                                                timeControler.text =
                                                    value!.format(context)
                                                        .toString();
                                                print(value.format(context));
                                              });
                                            }),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        defaultFormfelid(
                                            controller: dateControler,
                                            inputType: TextInputType.datetime,
                                            validate: (value) {
                                              if (value.isEmpty) {
                                                return "date must not be empty";
                                              }
                                              return null;
                                            },
                                            lebel: "date time",
                                            prefix: Icons.calendar_today,
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.parse(
                                                    '2023-05-07'),
                                              ).then((value) {
                                                print(DateFormat.yMMMd().format(
                                                    value!));
                                                dateControler.text =
                                                    DateFormat.yMMMd().format(
                                                        value);
                                              });
                                            })
                                      ])),
                            ),
                      ).closed
                          .then((value) {
                        Navigator.pop(context);
                       AppCubit.get(context).changeBottomSheetState(isShow:  false, icon: Icons.edit);

                      });
                      AppCubit.get(context).changeBottomSheetState(isShow:  true, icon: Icons.add);

                    }
                  },
                  child: Icon(AppCubit.get(context).fabicon),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: AppCubit
                      .get(context)
                      .currentIndex,
                  onTap: (index) {
                    AppCubit.get(context).changeIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu), label: "Tasks"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.check), label: "Done"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.archive), label: "Archive"),
                  ],
                ),
              );
            })
    );
  }

}





