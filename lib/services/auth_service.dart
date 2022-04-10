import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter_clone/models/user.dart' as model;
import 'package:instagram_flutter_clone/services/storage_service.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  static Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromDocument(snap);
  }

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

        var photoUrl = await StorageService.uploadImage(
            "profile_pics", cred.user!.uid, file, false);

        final user = model.User(
          uid: cred.user!.uid,
          username: username,
          bio: bio,
          photoUrl: photoUrl,
          email: email,
          followers: [],
          following: [],
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        result = "success";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  static Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String result = "error";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "success";
      } else {
        result = "please enter email and password";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
