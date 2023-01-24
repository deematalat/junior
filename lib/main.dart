
import 'package:flutter/material.dart';

import 'layouts/BMI/Bmi.dart';
import 'layouts/massenger/massenger.dart';
import 'layouts/todoapp/todo_layout.dart';




void main() {

  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
     home: Bmi(),
    );
  }
}
