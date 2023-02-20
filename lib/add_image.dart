import 'dart:io';
import 'dart:io' show File;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:uuid/uuid.dart';
import 'package:wisata_cirebon/add_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:wisata_cirebon/add_image.dart';

class addImage extends StatefulWidget {
  const addImage({Key? key}) : super(key: key);

  @override
  _addImage createState() => _addImage();
}

class _addImage extends State<addImage> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    Uint8List? file = result.files.first.bytes;
                    String fileName = result.files.first.name;

                    UploadTask task = FirebaseStorage.instance
                        .ref()
                        .child("files/$fileName")
                        .putData(file!);

                    task.snapshotEvents.listen((event) {
                      setState(() {
                        progress = ((event.bytesTransferred.toDouble() /
                                    event.totalBytes.toDouble()) *
                                100)
                            .roundToDouble();

                        if (progress == 100) {
                          event.ref
                              .getDownloadURL()
                              .then((downloadUrl) => print(downloadUrl));
                        }

                        print(progress);
                      });
                    });
                  }
                },
                child: Text("Pilih File untuk upload Firebase Storage"),
              ),
              SizedBox(
                height: 50.0,
              ),
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
                height: 200.0,
                width: 200.0,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 375),
                  child: progress == 100.0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Upload Complete',
                              style: GoogleFonts.poppins(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        )
                      : LiquidCircularProgressIndicator(
                          value: progress / 100,
                          valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                          backgroundColor: Colors.white,
                          direction: Axis.vertical,
                          center: Text(
                            "$progress%",
                            style: GoogleFonts.poppins(
                                color: Colors.black87, fontSize: 25.0),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


