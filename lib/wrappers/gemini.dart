import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Gemini {
  String api_key;
  final client = HttpClient();
  final endpoint = Uri.parse('https://notebooks.googleapis.com');

  Gemini({required this.api_key}) {

  }
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();
  final credential = GoogleAuthProvider.credential(idToken: googleUser!.authentication.idToken);

  return await FirebaseAuth.instance.signInWithCredential(credential);
}