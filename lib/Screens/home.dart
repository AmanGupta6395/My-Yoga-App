import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/custom_Appbar.dart';
import 'package:flutter_yoga/Screens/custom_Drawer.dart';
import 'package:flutter_yoga/Screens/start_Up.dart';
import 'package:flutter_yoga/services/yogadb.dart';

import '../Model/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _colorTween, _homeTween,_yogaTween, _drawerTween, _iconTween;
  late AnimationController _textAnimationController;
  bool isLoading = true;

  Future makeYogaEntry(Yoga yoga, String TableName) async{
    await YogaDatabase.instance.Insert(yoga, TableName);
  }

  Future makeYogaSummaryEntry(YogaSummary yogaSummary) async{
    await YogaDatabase.instance.InsertYogaSummary(yogaSummary);
  }

  late List<YogaSummary> yogaSumList;
  Future readYogaSumEntry() async{
    this.yogaSumList= await YogaDatabase.instance.readAllYogaSummary();
    isLoading = false;
      print(yogaSumList[0].YogaWorkOutName.toString());
  }
  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 0));
    _colorTween =  ColorTween(begin: Colors.transparent,end: Colors.white).animate(_animationController);
    _iconTween =  ColorTween(begin: Colors.white,end: Colors.lightBlue).animate(_animationController);
    _drawerTween =  ColorTween(begin: Colors.white,end: Colors.black).animate(_animationController);
    _homeTween =  ColorTween(begin: Colors.white,end: Colors.blue).animate(_animationController);
    _yogaTween =  ColorTween(begin: Colors.white,end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this,duration: const Duration(seconds: 0));
    super.initState();

    // makeYogaSummaryEntry(YogaSummary( YogaWorkOutName: YogaModel.YogaTable1, BackImg: "https://plus.unsplash.com/premium_photo-1682095736688-acd2ae20ffa4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", TimeTaken: "36", TotalNoOfWorkout: "4"));
    // makeYogaEntry(Yoga(Seconds: true, YogaTitle: "Padmasana", YogaImgUrl: "https://media.istockphoto.com/id/1219401141/photo/woman-practicing-yoga-in-lotus-position-at-park.jpg?s=1024x1024&w=is&k=20&c=YfZ9wcnRiJFvR-7VODH5TwqUdIp8-dXLd4a0704a3vs=", SecondsOrTimes: '25'),YogaModel.YogaTable1);
    // makeYogaEntry(Yoga(Seconds: true, YogaTitle: "Simhasan", YogaImgUrl: "https://images.unsplash.com/photo-1508050249562-b28a87434496?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", SecondsOrTimes: '30'),YogaModel.YogaTable1);
    // makeYogaEntry(Yoga(Seconds: true, YogaTitle: "Kapalbhati pranayama", YogaImgUrl: "https://media.istockphoto.com/id/860049504/photo/mature-middle-aged-fit-healthy-woman-practicing-yoga-kapalbhati-pranayama-position-outside-in.jpg?s=1024x1024&w=is&k=20&c=eC27SNtxuM9vf9inj8Fr5Mltfx7tm7HXFP8q7lK9HIA=", SecondsOrTimes: '45'),YogaModel.YogaTable1);
    // makeYogaEntry(Yoga(Seconds: true, YogaTitle: "Anulom vilom pranayama", YogaImgUrl: "https://media.istockphoto.com/id/2153376414/photo/young-indian-woman-doing-anulom-vilom-pranayama-yoga-pose-in-garden-sports-workout-meditation.jpg?s=2048x2048&w=is&k=20&c=l6hNCcj1T3iQDCcDKzYmNctfFUVu3VKTCyteQ5OhPYE=", SecondsOrTimes: '15'),YogaModel.YogaTable1);

    readYogaSumEntry();
  }

  bool scrollListner(ScrollNotification scrollNotification){
    bool scroll = false;
    if(scrollNotification.metrics.axis == Axis.vertical){
      _animationController.animateTo(scrollNotification.metrics.pixels/80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll =true;
    }
    return scroll;
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey ,
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
          onNotification: scrollListner,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(50, 120, 50, 40),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                  color: Colors.blue,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text("1",style: TextStyle(color: Colors.white,fontSize: 23),),
                                        Text("Streak",style: TextStyle(color: Colors.white,fontSize: 13),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("120",style: TextStyle(color: Colors.white,fontSize: 23),),
                                        Text("KCal",style: TextStyle(color: Colors.white,fontSize: 13),)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("26",style: TextStyle(color: Colors.white,fontSize: 23),),
                                        Text("Minutes",style: TextStyle(color: Colors.white,fontSize: 13),)
                                      ],
                                    ),
                                  ],
                                ),

                              ),
                              Container(
                                // height: 250,
                                margin: const EdgeInsets.all(20),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start ,
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(bottom: 5),
                                     child: Text("Yoga For All",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                   ),
                                   ListView.builder(shrinkWrap:true,
                                       physics: NeverScrollableScrollPhysics(),
                                       itemCount:yogaSumList.length,itemBuilder: (context,index){

                                     return InkWell(
                                       onTap: (){
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const StartUp()));
                                       },
                                       child: Padding(
                                         padding: const EdgeInsets.only(bottom: 15),
                                         child: Stack(
                                           children: [
                                             Container(
                                               height:150,
                                               decoration:  BoxDecoration(
                                                   image: DecorationImage(
                                                       fit: BoxFit.cover,
                                                       image: NetworkImage(
                                                         yogaSumList[index].BackImg.toString()
                                                       ))
                                               ),
                                             ),
                                             Container(
                                               height: 150,
                                               color: Colors.black26,
                                             ),
                                              Positioned(
                                                 right: 20,
                                                 left: 10,
                                                 top: 10,
                                                 child: Text(yogaSumList[index].YogaWorkOutName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                                              Positioned(
                                                 right: 20,
                                                 left: 10,
                                                 top: 38,
                                                 child: Text("Last Time:${yogaSumList[index].TimeTaken} Min ago",style: TextStyle(color: Colors.white,fontSize: 10),)),
                                           ],
                                         ),
                                       ),
                                     );
                                   }),

                                   Padding(
                                     padding: const EdgeInsets.only(bottom: 15),
                                     child: Stack(
                                       children: [
                                         Container(
                                           height:150,
                                           decoration: const BoxDecoration(
                                             image: DecorationImage(
                                                 fit: BoxFit.cover,
                                                 image: NetworkImage("https://images.unsplash.com/photo-1510894347713-fc3ed6fdf539?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
                                           ),
                                         ),
                                         Container(
                                           height: 150,
                                           color: Colors.black26,
                                         ),
                                         const Positioned(
                                             right: 20,
                                             left: 10,
                                             top: 10,
                                             child: Text("Weight Loss Yoga",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                                         const Positioned(
                                             right: 20,
                                             left: 10,
                                             top: 38,
                                             child: Text("Last Time: 22 Nov",style: TextStyle(color: Colors.white,fontSize: 10),)),
                                       ],
                                     ),
                                   ),
                                   Stack(
                                     children: [
                                       Container(
                                         height:150,
                                         decoration: const BoxDecoration(
                                           image: DecorationImage(
                                               fit: BoxFit.cover,
                                               image: NetworkImage("https://images.unsplash.com/photo-1534096210335-a3b961613bb5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
                                         ),
                                       ),
                                       Container(
                                         height: 150,
                                         color: Colors.black26,
                                       ),
                                       const Positioned(
                                           right: 20,
                                           left: 10,
                                           top: 10,
                                           child: Text("Suryanamaskar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                                       const Positioned(
                                           right: 20,
                                           left: 10,
                                           top: 38,
                                           child: Text("Last Time: 2 Nov",style: TextStyle(color: Colors.white,fontSize: 10),)),
                                     ],
                                   ),
                                 ],
                               ),
                              ),
                              Container(
                                // height: 250,
                                margin: const EdgeInsets.all(20),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start ,
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(bottom: 5),
                                     child: Text("Choose Your Type",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(bottom: 15),
                                     child: Stack(
                                       children: [
                                         Container(
                                           height:150,
                                           decoration: const BoxDecoration(
                                             image: DecorationImage(
                                                 fit: BoxFit.cover,
                                                 image: NetworkImage("https://images.unsplash.com/photo-1599901860904-17e6ed7083a0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
                                           ),
                                         ),
                                         Container(
                                           height: 150,
                                           color: Colors.black26,
                                         ),
                                         const Positioned(
                                             right: 20,
                                             left: 10,
                                             top: 10,
                                             child: Text("Power Yoga",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                                         const Positioned(
                                             right: 20,
                                             left: 10,
                                             top: 38,
                                             child: Text("Last Time: 16 Nov",style: TextStyle(color: Colors.white,fontSize: 10),)),
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(bottom: 15),
                                     child: Stack(
                                       children: [
                                         Container(
                                           height:150,
                                           decoration: const BoxDecoration(
                                             image: DecorationImage(
                                                 fit: BoxFit.cover,
                                                 image: NetworkImage("https://plus.unsplash.com/premium_photo-1663011449750-7c44e1d9ee1d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
                                           ),
                                         ),
                                         Container(
                                           height: 150,
                                           color: Colors.black26,
                                         ),
                                         const Positioned(
                                             right: 20,
                                             left: 10,
                                             top: 10,
                                             child: Text("Breathing Yoga",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                                         const Positioned(
                                             right: 20,
                                             left: 10,
                                             top: 38,
                                             child: Text("Last Time: 22 Sept",style: TextStyle(color: Colors.white,fontSize: 10),)),
                                       ],
                                     ),
                                   ),
                                   Stack(
                                     children: [
                                       Container(
                                         height:150,
                                         decoration: const BoxDecoration(
                                           image: DecorationImage(
                                               fit: BoxFit.cover,
                                               image: NetworkImage("https://images.unsplash.com/photo-1556816723-1ce827b9cfbb?q=80&w=1992&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
                                         ),
                                       ),
                                       Container(
                                         height: 150,
                                         color: Colors.black26,
                                       ),
                                       const Positioned(
                                           right: 20,
                                           left: 10,
                                           top: 10,
                                           child: Text("Flexible Yoga",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                                       const Positioned(
                                           right: 20,
                                           left: 10,
                                           top: 38,
                                           child: Text("Last Time: 20 Aug",style: TextStyle(color: Colors.white,fontSize: 10),)),
                                     ],
                                   ),
                                 ],
                               ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                    CustomAppbar(animationController:  _animationController, colorsTween: _colorTween, homeTween: _homeTween, yogaTween: _yogaTween, iconTween: _iconTween, drawerTween: _drawerTween, onPressed: (){scaffoldKey.currentState?.openDrawer();})
                  ],
                ),
              )
            ],
          )),

    );
  }
}
//body: SingleChildScrollView(
//         child: Column(
//
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text("1"),
//                       Text("Streak")
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text("1"),
//                       Text("Streak")
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text("1"),
//                       Text("Streak")
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Divider(thickness: 3,indent: 20,endIndent: 20,),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Yoga For All"),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       height: 150,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       height: 150,
//                       color: Colors.grey,
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Yoga For Students"),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       height: 150,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       height: 150,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       height: 150,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       height: 150,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
