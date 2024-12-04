import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/workout_Detail.dart';
import'package:provider/provider.dart';

class Ruready extends StatelessWidget {
  const Ruready({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
        create: (context)=>TimerModel(context),
    child: Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/2-100,),
              Text("ARE YOU READY?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 30,),
              Consumer<TimerModel>(builder: (context,myModel,child){
                return Text(myModel.countdown.toString(),style: TextStyle(fontSize: 40,),);
              }),
              Spacer(),
              Divider(thickness: 2,),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                    child: Text("Next: Anulom Villom",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ))
            ],
          ),
        ),
      ),
    ),
    );
  }
}
class TimerModel with ChangeNotifier{
  TimerModel(context){
    MyTimer(context);
  }
  int countdown = 5;
  MyTimer(context) async{
    Timer.periodic(Duration(seconds: 1), (timer){
      countdown--;
      notifyListeners();
      if(countdown==0){
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkoutDetail()));
      }
    });
  }
}
