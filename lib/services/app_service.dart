
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
String LOGIN_KEY = "5FD6G46SDF4GD64F1VG9SD68";
// ignore: non_constant_identifier_names
String ONBOARD_KEY = "GD2G82CG9G82VDFGVD22DVG";

/// AppService is responsible for managing the app initialization, it defines
/// the state and actions to handle the onBoarding and login pages
class AppService with ChangeNotifier {
  late final SharedPreferences sharedPreferences;

  bool _loginState = false;
  bool _initialized = false;
  bool _onBoarding = false;

  AppService(this.sharedPreferences);

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onBoarding => _onBoarding;


  set loginState(bool state) {
    sharedPreferences.setBool(LOGIN_KEY, state);
    _loginState = state;
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onBoarding(bool value) {
    sharedPreferences.setBool(ONBOARD_KEY, value);
    _onBoarding = value;
    notifyListeners();
  }

  /// onAppStart will perform any given async actions required to the app setup
  Future<void> onAppStart() async {
    _onBoarding = sharedPreferences.getBool(ONBOARD_KEY) ?? false;
    _loginState = sharedPreferences.getBool(LOGIN_KEY) ?? false;

    await Future.delayed(const Duration(seconds: 1));

    _initialized = true;
    notifyListeners();
  }
}
