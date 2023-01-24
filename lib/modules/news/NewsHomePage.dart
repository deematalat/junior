import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsHomePage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter",style:TextStyle(
                color:Colors.black,
                fontWeight: FontWeight.bold
            ),),
            Text("News",style:TextStyle(
              color:Colors.blue,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
      body:  ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context,index)=>Divider(),
          itemBuilder:(context,index)=>Divider() ,
          itemCount:2)
    );
  }
}
