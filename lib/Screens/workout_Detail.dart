import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/break.dart';
import 'package:provider/provider.dart';

class WorkoutDetail extends StatelessWidget {
  const WorkoutDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
        create: (context)=>TimerModelSec(context),
    child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.unsplash.com/photo-1545205597-3d9d02c29597?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
                    ),
                  ),
                  Spacer(),
                  Text("Anulom Vilom",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35),),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 80),
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("00",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                        Text(" : ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                        Consumer<TimerModelSec>(builder: (context,myModel,child){
                          return Text(myModel.countdown.toString(),style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),);
                        }),
                      ],
                    ),
                  ),
                  Spacer(),
                  Consumer<TimerModelSec>(builder: (context,MyModel,child){
                    return ElevatedButton(onPressed: (){
                      MyModel.show();
                    }, child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        child: Text("PAUSE",style: TextStyle(fontSize: 20),)));
                  }),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){}, child: Text("< PREVIOUS",style: TextStyle(fontSize: 16),)),
                        TextButton(onPressed: (){}, child: Text("Next >",style: TextStyle(fontSize: 16),)),
                      ],
                    ),
                  ),
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
            Consumer<TimerModelSec>(
              builder: (context,MyModel,child) {
                return Visibility(
                    visible: MyModel.visible,
                    child: Container(
                      color: Colors.blueAccent.withOpacity(0.9),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("PAUSE", style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),),
                          Text("Yoga Feels Better", style: TextStyle(
                              color: Colors.white, fontSize: 16),),
                          SizedBox(height: 10,),
                          OutlinedButton(onPressed: () {}, child: Container(
                              width: 180,
                              child: Text("RESTART", style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,))),
                          OutlinedButton(onPressed: () {}, child: Container(
                              width: 180,
                              child: Text("QUIT", style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,))),
                          OutlinedButton(onPressed: () {
                            MyModel.hide();
                          }, child: Container(
                              width: 180,
                              child: Text("RESUME", style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,)))

                        ],
                      ),
                    )
              );
              })
          ],
        ),
    ),
    );
  }
}
class TimerModelSec with ChangeNotifier{
  TimerModelSec(context){
    MyTimer(context);
  }
  int countdown = 30;

  bool visible = false;
  MyTimer(context)async{
    Timer.periodic(Duration(seconds: 01), (timer){
      countdown--;
      notifyListeners();
      if(countdown ==0){
        timer.cancel();
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Break()));
      }
    });

  }

  void show(){
    visible = true;
    notifyListeners();
  }
  void hide(){
    visible = false;
    notifyListeners();
  }
}
