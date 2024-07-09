
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamflix/services/database.dart';
class FireBase{
  final _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> userRegister({
    required String username,
    required String email,
    required String phone,
    required String password
  }) async{
    try{
      print("hjhjh");
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print("error");
      rethrow;
    }
  }
  Future<void> loginValidation({required String email, required String password})async{
    try{
     UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     if(user.credential!=null){
       dataBaseService.saveAuth(true);
     }

    }catch(e){
      rethrow;
    }
  }

  Future<User?> signinWithGoogle() async{
    try{
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if(googleUser == null){
        return null;
      }

      final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

      final AuthCredential credential=GoogleAuthProvider.credential(
        accessToken:  googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      final User? user = userCredential.user;
      return user;
    }catch(e){
      print(e);
      return null;
    }
  }
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}