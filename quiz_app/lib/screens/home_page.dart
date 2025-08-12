import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genel Kültür Quiz",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz_outlined,size: 100,color: Colors.deepOrange,),
            SizedBox(height: 15,),
            Text("Bilgini test et, puanını gör!",style: TextStyle(fontSize: 20,color: Colors.deepOrange),),
            SizedBox(height: 25,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage()));
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 12
                  )
                ),
                child: Text("BAŞLA",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          ],

        ),
      ),
    );
  }
}
