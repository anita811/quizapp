import 'package:flutter/material.dart';
class PersonalDetailsScreen extends StatefulWidget {
  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar
            (
              title: Text('Personal Details'),
              centerTitle: true,
            ),
        body:Column
        (
          crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          Center(
            child: CircleAvatar(
              radius:55,
              child:ClipOval(child: Image.network('https://cdn.dribbble.com/users/2364329/screenshots/4759681/dribbble-11.jpg',height:150))
            ),
          ),
          Center(child: Text("Edward")),
         Card
         (
           margin:EdgeInsets.all(12.0),
           child: Column
           (
             children: 
             [
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration
                  (
                  color: Colors.green,
                

                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text('Personal Info')),
                  SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: 
          [
            Text('Gender:Male'),
            // SizedBox(width:20),
            Text('Mail id:Edward@gmail.com'),


          ],),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
          [
            Text('DOB:19-10-2000'),
            SizedBox(width:20),
            Text('Blood Group:A +ve'),


          ],),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
          [
            Text('Mob:9569749910'),
            SizedBox(width:20),
            Text('Santhoor,Aluva Ernakulam'),


          ],),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
          [
            Text('State:Kerala'),
            SizedBox(width:20),


          ],),
             ],
           ),
         ),
        Card
        (
          margin: EdgeInsets.all(12.0),
          child: Column
          (
            children: 
            [

               Container(
                  padding: EdgeInsets.all(5.0),
                 margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration
                  (
                  color: Colors.green,

                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:                 Text('Parents Info'),
),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
          [
            Text('Father:Raghavam'),
            SizedBox(width:20),
            Text('Mother:Maya Ravi'),


          ],),
          SizedBox(height: 20),
          Row(
            children: [
              Text('Mail Id:Raghavam@gmail.com'),
            ],
          )
            ],
          ),
        )

        ],

        ),
      ),
    );
  }
}