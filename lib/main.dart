import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.red
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.blue,
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
       // primarySwatch: Colors.yellow
      ),
      home: Home(),
    );
  }
}

