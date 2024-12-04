import 'package:flutter/material.dart';

class Finish extends StatelessWidget {
  const Finish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    Image.network(
                      "https://img.freepik.com/free-vector/realistic-illustration-gold-cup-with-red-ribbon-winner-leader-champion_1262-13474.jpg",
                      width: 250,
                      height: 250,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "125",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "KCal",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "12",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Minutes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Do It AGAIN",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "SHARE",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Rate Our App",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
