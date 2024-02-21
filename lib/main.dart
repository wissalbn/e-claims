// import 'package:eclaims2/addclaim.dart';
import 'package:eclaims2/login.dart';
import 'package:flutter/material.dart';

void main() async {
  
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
      ),
      home:  const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

