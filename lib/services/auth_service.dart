import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
// Google sign in
  signInWithGoogle() async {
    // begin sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtain details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // creat a new credential for user
    final Credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finally, let's sign in
    return await FirebaseAuth.instance.signInWithCredential(Credential);
  }
}
