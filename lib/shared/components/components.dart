import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:untitled/layouts/todoapp/cubit_cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0,
  double height = 40,
  required String text,
  required VoidCallback function,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:
            background, // ps: لما نعمل decoration بنحط الcolor جوا عشان ما يعطي error//
      ),
      width: width,
      child: MaterialButton(
        height: height,
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text.toLowerCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormfelid({
  required TextEditingController controller,
  required TextInputType inputType,
  FormFieldValidator? validate,
  required String lebel,
  required IconData prefix,
  void Function()? onTap,
  bool isClickbale = true,
  IconData? suffix,
  bool isPassword = false,
  void Function()? suffixpresssed,
}) =>
    TextFormField(
      validator: validate,
      obscureText: isPassword,
      controller: controller,
      keyboardType: inputType,
      onTap: onTap,
      enabled: isClickbale,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(onPressed: suffixpresssed, icon: Icon(suffix)),
        labelText: lebel,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

Widget bulidItemTasks(Map model, context) =>Dismissible(key:Key(model['id'].toString()),
    child:
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text('${model['time']}'),
          ),
          SizedBox(width: 20.0),
          Expanded(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${model['title']}",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${model['date']}",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),),
          SizedBox(width: 20.0),
          IconButton(onPressed:(){
            AppCubit.get(context).updateData(satuts:'done', id:  model['id']);
          }, icon:Icon(Icons.check_box),color: Colors.green,),
          IconButton(onPressed:(){
            AppCubit.get(context).updateData(satuts:'archive', id:  model['id']);
          }, icon:Icon(Icons.archive_rounded),color: Colors.black45,),
        ],
      ),
    ),
  onDismissed: (direcation){
   AppCubit.get(context).deleteData(id:model['id'],);
  },
);
