import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wisata_cirebon/login.dart';
import 'package:wisata_cirebon/model/tambah_wisata.dart';
import 'package:wisata_cirebon/main_screen.dart';
import 'package:wisata_cirebon/models/tambah.dart';
import 'package:wisata_cirebon/header_drawer.dart';
import 'package:wisata_cirebon/providers/firestore.service.dart';
import 'package:wisata_cirebon/add_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:wisata_cirebon/show_image.dart';

  class WisataPage extends StatelessWidget {
    
    
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.orange
              ]
            )
          ),
        ),
          title: Text('Halaman wisata'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
             return const addImage();
             }));
          },child: Icon(Icons.image),
      ),
        drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
            const MyHeaderDrawer(),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Beranda"),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              }));},
            ),
            ListTile(
              leading: const Icon(Icons.back_hand),
              title: const Text("Kembali"),
              onTap: () {Navigator.pop(context);
},
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text("Menampilkan image"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShowImage();
              }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Login();
              }));
              },
            ),
            ],
          ),
        ),
      ),
      
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('tambahan').snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var tambahan = snapshot.data!.docs
              .map((tambahan) => tambah.fromSnapshot(tambahan))
              .toList();

              return ListView.builder(
                itemCount: tambahan.length,
                itemBuilder: (context, index) {
                  var id = snapshot.data!.docs[index].id;
                  return  ListTile(
               onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Tambahwisata(
                  //     tambah: tambahan[index],
                  //   );
                  // },));
               },
               title: Text(tambahan[index].name),
               subtitle: Text(tambahan[index].description),
               trailing: IconButton(onPressed: (){
                FirestoreService.deletetambah(id);
               }, icon: Icon (Icons.delete, color: Colors.red,)),
             );
                },
                );
            }
     
          
            
            return const Center(child: CircularProgressIndicator(),
            );
          }), 
          ));
      
    }
    
      formSnapshots(QueryDocumentSnapshot<Map<String, dynamic>> tambah) {}

    
   } 


// Column(
//           children:  [
//             ListTile(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return Tambahwisata();
//                 },));
//               },
//               title: Text('Nama Wisata'),
//               subtitle: Text('Alamat wisata'),
//             ),
//             ListTile(
//               title: Text('Nama Wisata'),
//               subtitle: Text('Alamat wisata'),
//             ),
//             ListTile(
//               title: Text('Nama Wisata'),
//               subtitle: Text('Alamat wisata'),
//             ),
//             ListTile(
//               title: Text('Nama Wisata'),
//               subtitle: Text('Alamat wisata'),
//             ),
//             ListTile(
//               title: Text('Nama Wisata'),
//               subtitle: Text('Alamat wisata'),
//             ),
//           ],
//           ),