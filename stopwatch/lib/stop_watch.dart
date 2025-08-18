import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds=0;
  Timer? timer;
  bool isReset=true;
  bool isWork=false;

  void startTimer(){
    timer=Timer.periodic(Duration(seconds: 1),(t){
      setState(() {
        seconds++;
        isWork=true;
        isReset=false;
      });
    });
  }

  void stopTimer(){
    timer?.cancel();
    setState(() {
      isWork=false;
    });
  }

  void resetTimer(){
    timer?.cancel();
    setState(() {
      seconds=0;
      isReset=true;
      isWork=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zamanlayıcı",
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.deepOrange,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.yellow,
              Colors.orangeAccent
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight)
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.yellow.shade100,
            Colors.orangeAccent.shade100,
          ],
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  value: (seconds % 60) / 60,
                  strokeWidth: 8,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
                ),
              ),
              Text(
                "${(seconds ~/60).toString().padLeft(2,'0')}:${(seconds%60).toString().padLeft(2,'0')}",
                style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.deepOrange),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(isWork&&!isReset)...[
                FloatingActionButton(
                  backgroundColor: Colors.red.shade400,
                    onPressed: stopTimer,
                    child: Icon(Icons.pause,color: Colors.white,)),
                SizedBox(width: 15,),
                FloatingActionButton(
                    backgroundColor: Colors.orange.shade400,
                    onPressed: resetTimer,
                    child: Icon(Icons.restart_alt,color: Colors.white,))
              ],
              if(!isWork && !isReset)...[
                FloatingActionButton(
                    backgroundColor: Colors.green.shade400,
                    onPressed:startTimer,
                    child: Icon(Icons.play_arrow,color: Colors.white,)),
                SizedBox(width: 15,),
                FloatingActionButton(
                    backgroundColor: Colors.orange.shade400,
                    onPressed: resetTimer,
                    child: Icon(Icons.restart_alt,color: Colors.white,))
              ],
              if(!isWork&&isReset)
                FloatingActionButton(
                    backgroundColor: Colors.green.shade400,
                    onPressed:startTimer,
                    child: Icon(Icons.play_arrow,color: Colors.white,)),
            ],
          ),

        ],
              ),
      ),
    );
  }
}
