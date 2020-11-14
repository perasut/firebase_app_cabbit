import 'package:firebase_app_cabbit/route/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthService {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static Stream<User> firebaseListner = _firebaseAuth.authStateChanges();
// สร้างฟังก์ชันสำหรับการขอ SMS OTP
  static void requestVerifyCode(String phoneNumber, String verificationId) async {
    
    
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+66"+ phoneNumber, 
      timeout: Duration(seconds: 10),
      verificationCompleted: (User){
        // 
      }, 
      verificationFailed:(error){
        print('Phone number verification failed');
      }, 
      codeSent: (verificationId,[forceResendingToken]){
        verificationId = verificationId;
        print(verificationId);
      }, 
      codeAutoRetrievalTimeout: (verificationId){
        // 
      }
    );
  }

  // สร้างฟังก์ชันสำหรับการ login
  static void firebaseSignIn(String email, String password) async {
    try {
      final _authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(_authResult.user.email);
      print(_authResult.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('Invalide email');
        Fluttertoast.showToast(
            msg: 'Invalide email',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Fluttertoast.showToast(
            msg: 'Wrong password provided for that user.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
  }

  // สร้างฟังก์ชันสำหรับการ regsiter
  static void firebaseRegister(String email, String password) async {
    BuildContext context;
    try {
      final _authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(_authResult);
      // Navigator.pushReplacementNamed(context, routeLogin);
      // Navigator.pushReplacementNamed(context, '/Login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Fluttertoast.showToast(
            msg: 'รหัสผ่านสั้นเกินไป ต้องมากว่า 6 ตัวอักษร',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacementNamed(context, routeRegister);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(
            msg: 'มีอีเมลล์นี้อยู่ในระบบแล้ว กรุณาใช้อีเมลล์อื่น',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacementNamed(context, routeRegister);
      }
      // } else if (e.code == null) {
      //   Navigator.pushReplacementNamed(context, routeLogin);
      // }
    } catch (e) {
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
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
