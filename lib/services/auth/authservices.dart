import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthServices{
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FirebaseUser> signInAnonymous() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser firebaseUser = result.user;
      return firebaseUser;
    } catch(e){
      print(e.toString());
      return null;
    }
  }


  static Future<FirebaseUser> signUp(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;

      return firebaseUser;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  static Future<FirebaseUser> signIn(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;

      return firebaseUser;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  static Future<void> signOut() async{
    _auth.signOut();
  }

  static Stream<FirebaseUser> get firebaseUserStream => _auth.onAuthStateChanged;

  static Future<String> verifUserNum(String number)async{
    String verified = 'false';
    QuerySnapshot snapshot = await Firestore.instance.collection('admin').where('phone', isEqualTo: number).getDocuments();

    List _userVerified=[];
    snapshot.documents.forEach((element) {
      _userVerified.add(element.data);
    });
    if(_userVerified.length != 0 ){
      verified = 'true';
      _userVerified.clear();
      return verified;
    } else {
    verified = 'false';
      return verified;
    }
  }
}
//static Future<FirebaseUser> signUp(String email, String password) async{
//  try{
//    AuthResult result = await _auth.createUserWithEmail
//}
//}