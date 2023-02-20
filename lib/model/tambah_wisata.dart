import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wisata_cirebon/models/tambah.dart';
import 'package:wisata_cirebon/providers/firestore.service.dart';
import 'package:wisata_cirebon/wisata_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';


class Tambahwisata extends StatefulWidget {
 const Tambahwisata({super.key, this.tambah});

  final Tambahwisata? tambah;

  @override
  State<Tambahwisata> createState() => _TambahwisataState();
  
}

class _TambahwisataState extends State<Tambahwisata> {
  File? image;
// var _nameController = TextEditingController();
 late TextEditingController nameController;
 late TextEditingController deskripsiController;
 
Future getImage() async{
  final ImagePicker _picker = ImagePicker();
   final XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
  image = File(imagePicked!.path);
  setState(() {
    
  });
}

@override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    deskripsiController = TextEditingController();
    
    
  }

@override
  void dispose() {
    nameController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
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
        title: Text('Form Tambah wisata Cirebon'),
        actions: [
          IconButton(onPressed: () async {
            await FirestoreService.addTambah(
              tambah(
                name: nameController.text, description: deskripsiController.text)
                );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WisataPage();
              }));
          }, icon: Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController ,
            decoration: InputDecoration(
              hintText: 'Masukan nama wisata',
              label: Text('Nama wisata')
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: deskripsiController ,
            decoration: InputDecoration(
              hintText: 'Masukan alamat wisata',
              label: Text('Alamat wisata')
            ),
          ),
          
          
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       image !=null ? Container(height: 200, width: MediaQuery.of(context).size.width
          //        ,child: Image.file(image! , fit: BoxFit.cover,)) : Container(),
          //       TextButton(
          //         style: TextButton.styleFrom(backgroundColor: Colors.blueAccent), onPressed: () async{
          //           await getImage();
          //         },
          //         child: Text('Upload Foto',style: TextStyle(color: Colors.white),)
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
    
  }
  
}