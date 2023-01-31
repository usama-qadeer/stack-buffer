import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class FirebaseWork {
  static Future<String?> createAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code.length < 6) {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

/*SignOut Fun */

  static Future<String>? signOut() {
    FirebaseAuth.instance.signOut();
  }

/*SignIn Fun */

  static Future<String?> signAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> addData(
    String time,
    String date,
    String attendees,
    String venue,
    String name,
    String email,
    String number,
  ) async {
    _firebaseFirestore
        .collection("data")
        .add({
          "time": time,
          "date": date,
          "attendees": attendees,
          "venue": venue,
          "name": name,
          "email": email,
          "number": number,
        })
        .whenComplete(() => print("ok"))
        .catchError((e) {
          print(e.toString());
        });
  }
}
