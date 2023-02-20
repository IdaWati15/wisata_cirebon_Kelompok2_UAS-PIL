import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wisata_cirebon/main_screen.dart';
import 'package:wisata_cirebon/main.dart';
import 'package:wisata_cirebon/login.dart';
import 'package:wisata_cirebon/wisata_page.dart';
import 'package:wisata_cirebon/models/tambah.dart';
import 'package:wisata_cirebon/model/tambah_wisata.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:wisata_cirebon/splashscreen.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb){
  await Firebase.initializeApp(
    options: FirebaseOptions(
       apiKey: "AIzaSyDLJr0QTXaOKm4Xhc_69uUorGtBjQ7ZbW4",
  projectId: "wisata-cirebon-rekom-app",
  storageBucket: "wisata-cirebon-rekom-app.appspot.com",
  messagingSenderId: "1010269774338",
  appId: "1:1010269774338:web:12262decb33e00829bfd1b"
  )
  );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  get place => null;
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Cirebon',
      theme: ThemeData(),
      home: splashscreen(),
      
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text("Login"),
      //   ),
      // body: Column(
      //   children: [
      //     Text("SELAMAT DATANG"),
      //     Padding(
      //       padding: EdgeInsets.all(20),
      //       child: TextField(
      //       decoration: InputDecoration(
      //         border: OutlineInputBorder(),
      //         hintText: "Silahkan masukan username",
      //       ),
      //       ),
      //       ),
      //       Padding(
      //       padding: EdgeInsets.all(20),
      //       child: TextField(
      //         obscureText: true,
      //       decoration: InputDecoration(
      //         border: OutlineInputBorder(),
      //         hintText: "Silahkan masukan password",
      //       ),
      //     ),
      //       ),
          
          
      //     ElevatedButton(onPressed: (){
      //     }, child: Text("LOGIN")
      //     ),
          
      //     Padding(padding: EdgeInsets.all(20)),
      //     ElevatedButton(onPressed: (){
      //     }, child: Text("Create Accout")
      //     ),
          
      //   ],
      // ),
      // ),
    );
  }
}
