import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter_clone/models/user.dart';
import 'package:instagram_flutter_clone/services/auth_service.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User get getUser => _user!;

  Future<void> refreshUser() async {
    _user = await AuthService.getUserDetails();
    notifyListeners();
  }
}
