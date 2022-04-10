class User {
  final String uid;
  final String username;
  final String bio;
  final String password;
  final List<String> followers;
  final List<String> following;
  final String photoUrl;
  final String email;

  User({
    required this.uid,
    required this.username,
    required this.bio,
    required this.password,
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
      'password': password,
      'followers': followers,
      'following': following,
      'photoUrl': photoUrl,
      'email': email,
    };
  }
}
