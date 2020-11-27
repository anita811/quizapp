import 'package:flutter/material.dart';
import 'package:quizapp/screens/Signup/signup_screen.dart';
import 'package:quizapp/views/home.dart';
import '../../constants.dart';

import 'background.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body:Background(
           child: Center(
             child: SingleChildScrollView(
                 child: Form(
                   key: formKey,
                   child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                           Text(
                                "LOGIN",
                           style: TextStyle(fontWeight: FontWeight.bold),
                       ),
                     SizedBox(height: size.height * 0.03),
                     SizedBox(height: size.height * 0.03),
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: kPrimaryColor,
                            onSaved: (val) {},
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kPrimaryColor,
                              ),
                              hintText: "Username",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      TextFieldContainer(
                        child:TextFormField(
                          obscureText: true,
                          onSaved: (val){},
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintText: "Password",
                            icon: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                            ),
                            suffixIcon: Icon(
                              Icons.visibility,
                              color: kPrimaryColor,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                       ),

                      RoundedButton(
                       text: "LOGIN",
                       press: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) {
                               return MyHomePage();
                             },
                           ),
                         );
                       },
                    ),
                     SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                             builder: (context) {
                               return SignupScreen();
                              },
                          ),
                        );
                      },
                     ),
                    ] ),
                 ),
             ),
           ),
        ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}


