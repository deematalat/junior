/*import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class bmiResult extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        leading: IconButton(
          icon:  Icon(Icons.arrow_left_sharp,size: 40.0,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text( "Gender : ${isMale?"Male":"Female"}",style: TextStyle(
                fontSize:25.0,
                fontWeight: FontWeight.bold,
              ),),
              Text( "Result :   $result",style: TextStyle(
              fontSize:25.0,
              fontWeight: FontWeight.bold,
            ),),
              Text( "Age    :   $age",style: TextStyle(
              fontSize:25.0,
              fontWeight: FontWeight.bold,
            ),),


          ],
        ),
      ),
    );
  }
}
 */