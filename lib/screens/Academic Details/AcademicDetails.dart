import 'package:flutter/material.dart';
class AcademicDetailsScreen extends StatefulWidget {
  @override
  _AcademicDetailsScreenState createState() => _AcademicDetailsScreenState();
}

class _AcademicDetailsScreenState extends State<AcademicDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar
            (
              title: Text('Academy Details'),
              centerTitle: true,
            ),
        body:Column
        (
        children: 
        [
          Center(
            child: CircleAvatar(
              radius:55,
              child:ClipOval(child: Image.network('https://cdn.dribbble.com/users/2364329/screenshots/4759681/dribbble-11.jpg',height:150))
            ),
          ),
          Center(child: Text("Edward")),
          Card(
            margin: EdgeInsets.all(13.0),
            child: Column
            (
              
              children: 
              [
                Container
                (
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration
                  (
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                child: Text('Course Info')),
                SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
          [
            Text('Academic year:2018-22'),
            SizedBox(width:20),
            Text('CSE'),
          ],),
          SizedBox(height: 20,),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
          [
            Text('Section:1'),
            SizedBox(width:20),
            Text('Current semester:s5'),


          ],),
          SizedBox(height: 20,),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
          [
            Text('Coordinator faculty:Mr Anjana'),
            SizedBox(width:20),
            Text('Mail id:anjana@scms.org'),


          ],),
 
              ],
            ),
          )   
        ],

        ),
      ),
    );
  }
}