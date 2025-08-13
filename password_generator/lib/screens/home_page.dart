import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/utils/generate_password.dart';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  String newPassword="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifre Oluşturucu",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ?newPassword.isNotEmpty?
              Column(

                children: [
                  Text("Yeni Şifreniz:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(newPassword,style: TextStyle(fontSize: 18),),
                    SizedBox(width: 10,),
                    IconButton(onPressed: (){
                      Clipboard.setData(ClipboardData(text: newPassword));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Şifreniz panoya kopyalandı")));
                    },
                      icon: Icon(Icons.copy),
                    color: Colors.pink,
                    tooltip: "Kopyala",)
                  ],)
                  
                ],
              ):null,
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              setState(() {
                newPassword=generatePassword();
              });
            },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink,foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )),
                child: Text("Yeni Şifre",style: TextStyle(fontSize: 20),))
          ],
        ),
      ),),
    );
  }
}
