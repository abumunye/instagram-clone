import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;
  final String email;

  User({
    required this.uid,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'bio': bio,
      'followers': followers,
      'following': following,
      'photoUrl': photoUrl,
      'email': email,
    };
  }

  static User fromDocument(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }
}
