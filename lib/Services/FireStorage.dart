import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FireStorage {
  FireStorage();
  static Future<dynamic> loadImage(BuildContext context, String Image, int journeyID) async {
    return await FirebaseStorage.instance.ref().child("Images").child(journeyID.toString()).child(Image).getDownloadURL();
  }
}