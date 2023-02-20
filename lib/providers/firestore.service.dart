import 'package:firebase_core/firebase_core.dart';
import 'package:wisata_cirebon/models/tambah.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wisata_cirebon/wisata_page.dart';
class FirestoreService{
  static Future<void> addTambah(tambah tambah) async {
    await FirebaseFirestore.instance
    .collection('tambahan')
    .add(tambah.toJson());
  }

  static Future<void> deletetambah(String id) async {
    await FirebaseFirestore.instance.collection('tambahan').doc(id).delete();
  }
}