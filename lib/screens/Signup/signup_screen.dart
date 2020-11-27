import 'package:flutter/material.dart';
import 'package:quizapp/screens/Login/login_screen.dart';
import '../../constants.dart';
import 'background.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => new _SignupScreenState();
}

class _SignupScreenState  extends State<SignupScreen> {

  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SIGNUP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                TextFieldContainer(
                 child: TextFormField(
                   onSaved: (val){},
                   cursorColor: kPrimaryColor,
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
                  DropdownList(),
                TextFieldContainer(
                 child: TextFormField(
                  obscureText: true,
                  onSaved: (val){},
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: kPrimaryColor,
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
                  TextFieldContainer(
                    child: TextFormField(
                      obscureText: true,
                      onSaved: (val){},
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ),
                        hintText: "Confirm Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    press:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder:(context) {
                          return LoginScreen();
                        },
                      ),
                      );
                    }
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
class DropdownList extends StatefulWidget {
  DropdownList({Key key}) : super(key: key);

  @override
  _DropdownListState createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  String dropdownValue = 'Student';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(29)
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        iconSize: 24,
        elevation: 50,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Faculty','Student']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
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


