import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_page.dart';

class ResultPage extends StatefulWidget {
  final int score;
  final int correct;
  final int wrong;
  const ResultPage({required this.score,required this.correct,required this.wrong,super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sonuç Sayfası",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      centerTitle: true,
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      elevation: 4,),
      body: Center(
        child: Padding(padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Card(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15)
             ),
             color: Colors.white,
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 children: [
                   Text("Test Sonucunuz:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                   SizedBox(height: 15,),
                   Text("Skorunuz: ${widget.score}!",style: TextStyle(fontSize: 15),),
                   Text("Doğru sayısı: ${widget.correct}",style: TextStyle(fontSize: 15),),
                   Text("Yanlış sayısı: ${widget.wrong}",style: TextStyle(fontSize: 15),)
                 ],
               ),
             ),
           ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15)
                ),
                child: Text("Tekrar dene!",style: TextStyle(fontSize: 20),))
          ],
        ),),
      ),
    );
  }
}
