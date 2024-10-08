import 'package:flutter/widgets.dart';
import 'package:instamilligram/models/user.dart';
import 'package:instamilligram/resources/auth_methods.dart';

//with coz we are inheriting from ChangeNotifier
class UserProvider with ChangeNotifier {
  //_ means a private field so add that 
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}