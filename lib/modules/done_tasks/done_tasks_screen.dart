

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layouts/todoapp/cubit_cubit.dart';
import '../../shared/components/components.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<AppCubit,AppState>(builder: (Context,State ){
      var tasks= AppCubit.get(context).doneTasks;
      return ConditionalBuilder(
          condition:  tasks.length>0,
          builder:  (context)=>  ListView.separated(
              padding: EdgeInsetsDirectional.only(
                  start: 20
              ),
              itemBuilder: (context,index)=>bulidItemTasks(tasks[index],context),
              separatorBuilder:(context,index)=>Container(
                width:double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
              itemCount: tasks.length
          ),
          fallback:(context)=>Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Icon( Icons.menu,
           size: 100.0,
             color: Colors.grey,
           ),
            Text('No Tasks Yet,Please Add Some Tasks',
            style:TextStyle(
                  fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ) ,
            )
        ],
      ),
      ),

      );
    }, listener: (Context,State){}

    );
  }
}

