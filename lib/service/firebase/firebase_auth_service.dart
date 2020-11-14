import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static Stream<User> firebaseListner = _firebaseAuth.authStateChanges();

  // สร้างฟังก์ชันสำหรับการ login
  static void firebaseSignIn(String email, String password) async {
    try{
      final _authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      print(_authResult.user.email);
      print(_authResult.user);
      

    }catch(e){
      print(e);
    }
  }

  // สร้างฟังก์ชันสำหรับการ regsiter
  static void firebaseRegister(String email, String password) async {
    try{
      final _authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      print(_authResult);
    }catch(e){
      print(e);
    }
  }

  // สร้างฟังก์ชันสำหรับการดึงข้อมูล User ออกมาใช้
  static firebaseUserDetail() {
    final User user = _firebaseAuth.currentUser;
    return user.email;
  }

  // สร้างฟังก์ชันสำหรับการ logout
  static void firebaseLogout() async {
    try{
      await _firebaseAuth.signOut();
    }catch(e){
      print(e);
    }
  }

}