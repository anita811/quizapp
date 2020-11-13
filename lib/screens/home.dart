import 'package:flutter/material.dart';

import '../constants.dart';
import 'Academic Details/AcademicDetails.dart';
import 'PersonalDetailsScreen/personaldetails.dart';
class RoundedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.icon,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        height:size.height*0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: color,
            onPressed: press,
            child:Column(
             children:<Widget>[
              SizedBox(height: size.height * 0.05),
              Icon(icon,size:50,),
              SizedBox(height: size.height * 0.05),
              Text(text, style: TextStyle(color: textColor,),
            ),
          ],
        ),
        ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.1),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              icon:Icons.person,
              text: "Personal Details",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                     return PersonalDetailsScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              icon:Icons.book_rounded,
              text: "Academic Details",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AcademicDetailsScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
    ),
    );
  }
}

