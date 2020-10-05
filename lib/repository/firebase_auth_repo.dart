import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthRepo {
  FirebaseAuth fba;

  FireBaseAuthRepo._() {
    fba = FirebaseAuth.instance;
  }

  static FireBaseAuthRepo repo = FireBaseAuthRepo._();

  Future<UserCredential> signUp(email, password) {
    return fba
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print("user email: ${value.user.email}");
      return value;
    });
  }

  Future<UserCredential> signIn(email, password) {
    return fba
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print("user email: ${value.user.email}");
      print(value.user.email);
      return value;
    });
  }

  signOut() {
    return fba.signOut().then((value) {
      print(fba.currentUser);
    });
  }
}
