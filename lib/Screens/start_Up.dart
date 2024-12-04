import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/rUready.dart';

class StartUp extends StatefulWidget {
  const StartUp({super.key});

  @override
  State<StartUp> createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(style:ElevatedButton.styleFrom(
        backgroundColor: Colors.blue
      ),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Ruready()));
      }, child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        child: Text("START",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
      )),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text("All In One Yoga",style: TextStyle(color: Colors.white),),
              // centerTitle: true,
              background: Image.network("https://plus.unsplash.com/premium_photo-1682097802069-404b1f37ec49?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,),
            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up))
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding:EdgeInsets.only(left: 10,top: 5),
                    child: Text("20 mins || 16 Workouts ",style: TextStyle(fontWeight: FontWeight.w600),)),
                Divider(thickness: 2,),
                ListView.separated(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>ListTile(
                  leading: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Image.network("https://plus.unsplash.com/premium_photo-1682097802069-404b1f37ec49?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,)),
                  title: Text("YOGA ${index+1}",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("00:20"),
                ), separatorBuilder: (context,index)=>Divider(thickness: 2,), itemCount: 9)
              ],
            ),
          )
        ],
      ),
    );
  }
}