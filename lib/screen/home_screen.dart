  
import 'package:firebase_app_cabbit/service/firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  String userEmail = FirebaseAuthService.firebaseUserDetail();
  
  // var getUser = FirebaseAuthService.firebaseUserDetail();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: () {
              FirebaseAuthService.firebaseLogout();
              Navigator.pushReplacementNamed(context, '/login');
            }
          )
        ],
      ),
      body: Center(
        child: Text('${userEmail ?? "..."}'),
      ),
    );
  }
}
