import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wisata_cirebon/login.dart';
import 'package:wisata_cirebon/splashscreen.dart';
import 'package:wisata_cirebon/main.dart';

class splashscreen extends StatefulWidget{
  const splashscreen({Key?key}) : super(key: key);

  @override
  _SplashScrennState createState() => _SplashScrennState();
}

class _SplashScrennState extends State<splashscreen>{
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) =>  Login()));

    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo2.jpg',
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}