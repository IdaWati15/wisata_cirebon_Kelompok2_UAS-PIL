import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:wisata_cirebon/show_image.dart';
import 'package:wisata_cirebon/add_image.dart';
import 'package:wisata_cirebon/wisata_page.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImage();
}

class _ShowImage extends State<ShowImage> {
  bool imageAvailable = false;
  late Uint8List imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
             return const addImage();
             }));
          },child: Icon(Icons.upload_file),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      
                    ],
                  ),
                ),
              ),
            Container(
              height: 120,
              width: 120,
              color: Colors.white,
              child: imageAvailable ? Image.memory(imageFile) : const SizedBox(),
            ),
            GestureDetector(
              onTap: () async {
                final image = await ImagePickerWeb.getImageAsBytes();

                setState(() {
                  imageFile = image!;
                  imageAvailable = true;
                });
              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.orange,
                child: Center(
                  child: Text("Pick Image"),
                ),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}