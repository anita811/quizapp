import 'package:flutter/material.dart';
import 'package:quizapp/services/database.dart';
import 'package:quizapp/views/create_quiz.dart';
import 'package:quizapp/views/play_quiz.dart';
import 'package:quizapp/widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    return Container(
      child: Column(
        children: [
          StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return QuizTile(
                      quizTitle: snapshot.data.docs[index].data()['quizTitle'],
                      quizDesc: snapshot.data.docs[index].data()['quizDesc'],
                      department: snapshot.data.docs[index].data()['department'],
                      difficulty: snapshot.data.docs[index].data()['difficulty'],
                      quizId: snapshot.data.docs[index].data()['quizId'],
                      noOfQuestions: snapshot.data.docs.length,
                    );
                  });
            },
          )
        ],
      ),
    );
  }
  @override
   void initState() {
     databaseService.getQuizData().then((val) {
       setState(() {
         quizStream = val;
       });
     });
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        //brightness: Brightness.li,
      ),
      body:SingleChildScrollView(
          child:quizList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
         Navigator.push(
           context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String quizTitle, quizDesc, department, difficulty, quizId;
  final int noOfQuestions;

  QuizTile(
      { @required this.quizTitle,
        @required this.quizDesc,
        @required this.department,
        @required this.difficulty,
        @required this.quizId,
        @required this.noOfQuestions
      }
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => QuizPlay(quizId)
        ));
      },
      child: Container(
        margin:EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 145,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Container(
                color: Colors.blue[100],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quizTitle,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        quizDesc,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
