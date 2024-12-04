import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Break extends StatelessWidget {
  const Break({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerBreak>(
        create: (context)=>TimerBreak(context),
    child: Scaffold(
      body:Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://plus.unsplash.com/premium_photo-1675109079063-b4e4aa93b3d6?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
            ),

         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Spacer(),
               Text("Break Time",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
               Consumer<TimerBreak>(builder: (context,myModel,child){
                 return Text("${myModel.countdown.toString()}s",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),);
               }),
               SizedBox(height: 10,),
               ElevatedButton(onPressed: (){}, child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                 child: Text("SKIP",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
               )),
               Spacer(),
               Container(
                 margin: EdgeInsets.symmetric(horizontal: 15),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     TextButton(onPressed: (){}, child: Text("< PREVIOUS",style: TextStyle(fontSize: 16,color: Colors.white),)),
                     TextButton(onPressed: (){}, child: Text("Next >",style: TextStyle(fontSize: 16,color: Colors.white),)),
                   ],
                 ),
               ),
             ],
           ),
         )

    ),
    ));
  }
}

class TimerBreak with ChangeNotifier{
  TimerBreak(context){
    MyBreak(context);
  }
  int countdown = 20;
  MyBreak(context){
    Timer.periodic(Duration(seconds: 1), (timer){
      countdown--;
      notifyListeners();
      if(countdown==0){
        timer.cancel();

      }
    });
  }
}
