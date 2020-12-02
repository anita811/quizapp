import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class DatabaseService {

  Future<void> addQuizData(Map quizData, String quizId) async {
    await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> delQuizData(Map quizData, String quizId) async {
    await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .delete();
  }

  Future<void> addQuestionData(quizData, String quizId) async {
    await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection("quiz").snapshots();
  }

  getQuestionData(String quizId) async{
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }
}

