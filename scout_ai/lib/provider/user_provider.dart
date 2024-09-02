import 'package:flutter/material.dart';
import 'package:scout_ai/classes/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
  void setName(String newName) {
    _user?.fname = newName;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
