import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://plus.unsplash.com/premium_photo-1663011449750-7c44e1d9ee1d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
              ),
            ),
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.restart_alt,size: 28,)),
                Text("RESTART PROGRESS",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 28,)),
                Text("Share",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.star,size: 28,)),
                Text("Rate Us",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.feedback_outlined,size: 28,)),
                Text("Feedback",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.privacy_tip_outlined,size: 28,)),
                Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(thickness: 2,indent: 30,endIndent: 30,),
            Text("Version 1.0.0",style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
