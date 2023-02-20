import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wisata_cirebon/wisata_page.dart';
import 'package:wisata_cirebon/model/tambah_wisata.dart';
class tambah{
  String name;
  String description;
  

  tambah({
    required this.name,
    required this.description,
   
  });

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'description' : description,
      
    };
  }

  factory tambah.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> json){
    return tambah(name: json ['name'], description: json ['description']);
  }

  
}