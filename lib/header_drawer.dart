import'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer ({Key? key}) :super(key: key);
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent[600],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('images/logo2.jpg'),
              ),
            ),
          ),
          const Text("Kelompok 2'", style: TextStyle(color: Colors.black,fontSize: 20),),
          const Text("Cirebon the great of secret", style: TextStyle(color: Colors.black,fontSize: 14),),
          
        ],
      ),
    );
  }
}