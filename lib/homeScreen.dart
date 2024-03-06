import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
         Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Home Screen",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:30 )),
          centerTitle: true,
        ),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius:105,backgroundColor:Colors.white,child:CircleAvatar(radius: 100, backgroundImage: AssetImage('images/WhatsApp Image 2024-03-06 at 16.28.31_9c11fbef.jpg'),)),
              Text("Ahmed Abobakr",style: TextStyle(fontSize: 30),),
              Text("Flutter developer\n",style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  height: 40 ,
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      Icon(Icons.phone),
                      SizedBox(width: 15,),
                      SelectableText("01012619831",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  height: 40 ,
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      Icon(Icons.mail),
                      SizedBox(width: 15,),
                      SelectableText("ahmed.abobakr1111111@gmail.com",style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
              )
            ],),
        ),
      );
  }
}