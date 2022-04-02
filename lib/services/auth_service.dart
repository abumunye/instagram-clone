import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:instagram_flutter_clone/services/storage_service.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  static Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String result = "error";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        debugPrint("uid: ${cred.user!.uid}");

        var photoUrl = await StorageService.uploadImage(
            "profile_pics", cred.user!.uid, file, false);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'username': username,
          'bio': bio,
          'password': password,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });
        result = "success";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
