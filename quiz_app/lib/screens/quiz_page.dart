import 'package:flutter/material.dart';
import 'package:quiz_app/model/test.dart';
import 'package:quiz_app/screens/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex=0;
  int score=0;
  int correct=0;
  int wrong=0;

  void nextQuestion(String selectedAnswer){
    if(testQuestions[currentQuestionIndex].answer==selectedAnswer){
      score+=10;
      correct++;
    } else{
      score-=2;
      wrong++;
    }

    if(currentQuestionIndex<testQuestions.length-1){
      setState(() {
        currentQuestionIndex++;
      });
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultPage(correct: correct,score: score,wrong: wrong,)));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SORULAR",style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body:Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(testQuestions[currentQuestionIndex].question,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          ...testQuestions[currentQuestionIndex].choice.map((option){
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(onPressed: ()=>nextQuestion(option),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(option)),
              ),
            );
          }).toList()
        ],
      ),)
    );
  }
}
