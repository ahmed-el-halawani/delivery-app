import 'dart:async';

import 'package:delivery_app/repository/firebase_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';
import 'auth_result_state.dart';
import 'firebase_auth_exception.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthResultStatus state = AuthResultStatus.initAuth;
  FireBaseAuthRepo authRepo;

  AuthenticationProvider._() {
    authRepo = FireBaseAuthRepo.repo;
    changeState();
  }

  changeState() {
    if (authRepo.fba.currentUser != null) {
      state = AuthResultStatus.successful;
    } else {
      state = AuthResultStatus.undefined;
    }
  }

  static AuthenticationProvider auth = AuthenticationProvider._();

  Future<AuthResultStatus> signUp(email, password) async {
    try {
      await authRepo.signUp(email, password);
    } catch (e) {
      state = MyAuthException.handleException(e);
      print("my value ${e.code}");
    }
    changeState();
    notifyListeners();
    return state;
  }

  Future<AuthResultStatus> signIn(email, password) async {
    try {
      await authRepo.signIn(email, password);
    } catch (e) {
      state = MyAuthException.handleException(e);
    }
    changeState();
    notifyListeners();
    return state;
  }

  Future signOut() {
    authRepo.signOut().then((value) {
      changeState();
      notifyListeners();
    });
  }
}
