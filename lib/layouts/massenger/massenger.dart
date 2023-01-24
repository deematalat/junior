import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MassrngerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGBsIKMPqjSVdKg58ot9lkXBR16yILSP8E9Q&usqp=CAU'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        titleSpacing: 20.0,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 20,
            child: IconButton(
              onPressed: () {
                print("camera");
              },
              icon: Icon(Icons.camera_alt),
            ),
          ),
          SizedBox(
            width: 7.0,
          ),
          CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 20,
              child: IconButton(
                onPressed: () {
                  print("");
                },
                icon: Icon(Icons.edit),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            Container(
              color: Colors.grey[300],
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10.0),
                  Text("search"),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              height: 100.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder:(cotext,index)=> bulidstory(),
                separatorBuilder:(context,index)=>  SizedBox(width: 20.0,),
              itemCount: 8 ,shrinkWrap: true,
            ),),
            SizedBox(height:20.0 ,),
            ListView.separated(physics:NeverScrollableScrollPhysics(),
               itemBuilder:(context,index)=>buliditem(),
              separatorBuilder:(context,index)=>SizedBox(height:20.0,),
              itemCount:10
              ,shrinkWrap: true,),
              ],
            ),)
        ),
    );
  }
}

Widget buliditem() => Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGBsIKMPqjSVdKg58ot9lkXBR16yILSP8E9Q&usqp=CAU'),
              radius: 25.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 8.0,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 7.0,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "kim taehyung v",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text("Hello it's v , i'm a good boy"),
                  SizedBox(
                    width: 40,
                  ),
                  Text("2:00 pm"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
Widget bulidstory()=>Container(
  width: 60.0,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGBsIKMPqjSVdKg58ot9lkXBR16yILSP8E9Q&usqp=CAU'),
            radius: 25.0,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 8.0,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 7.0,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 2.0,
      ),
      Text(
        'kim taehyung v',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  ),
);
