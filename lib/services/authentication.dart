import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignUpAndSignIn {
  static Future<User?> signUp(
      String email, String password, String name) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(name);
      return userCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<User?> signIn(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      Get.snackbar('Error', 'Login Failed');
    }
    return null;
  }

  static Future<User?> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signOut();
    } catch (e) {
      Get.snackbar('Error', 'Logout Failed');
    }
    return null;
  }
}
