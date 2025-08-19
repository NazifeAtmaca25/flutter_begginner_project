import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int red=0;
  int green=0;
  int blue=0;


  @override
  Widget build(BuildContext context) {
    String hexCode="#${red.toRadixString(16).padLeft(2,'0')}${green.toRadixString(16).padLeft(2,'0')}${blue.toRadixString(16).padLeft(2,'0')}";

    return Scaffold(
      appBar: AppBar(
        title: Text("Renk Seçici",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 30 ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.cyan,
              Colors.blue,
              Colors.purple
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight)
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            color:Color.fromRGBO(red, green, blue, 1) ,
          ),
          SizedBox(height: 30,),
          Container(
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                Text("Renk: ${hexCode.toUpperCase()}",
                  style: TextStyle(fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: (){
                        Clipboard.setData(ClipboardData(text: hexCode.toUpperCase()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Renk kodu kopyalandı.")));
                      },
                      label:Text("Kopyala"),
                      icon: Icon(Icons.copy,color: Colors.white,),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade500,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10)
                      ),
                    ),
                    SizedBox(width: 15,),
                    ElevatedButton.icon(
                      onPressed: (){
                        setState(() {
                          red=0;
                          green=0;
                          blue=0;
                        });
                      },
                      label: Text("Sıfırla"),
                      icon: Icon(Icons.refresh,color: Colors.white,),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade500,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10)
                      ),
                    )
                  ],),
              ],
            ),
          ),

          SizedBox(height: 20,),
          Text("Kırmızı: $red",style: TextStyle(fontSize: 20),),
          Slider(
            activeColor: Colors.red.shade600,
              value: red.toDouble(),
              max: 255,
              min: 0,
              onChanged: (value){
                setState(() {
                  red=value.toInt();
                });
              }),
          Text("Yeşil: $green",style: TextStyle(fontSize: 20),),
          Slider(
            activeColor: Colors.green.shade600,
              value: green.toDouble(),
              max: 255,
              min: 0,
              onChanged: (value){
                setState(() {
                  green=value.toInt();
                });
              }),
          Text("Mavi: $blue",style: TextStyle(fontSize: 20),),
          Slider(
            activeColor: Colors.blue.shade600,
              value: blue.toDouble(),
              max: 255,
              min: 0,
              onChanged: (value){
                setState(() {
                  blue=value.toInt();
                });
              })
        ],
      ),
    );
  }
}
