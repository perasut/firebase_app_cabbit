import 'package:firebase_app_cabbit/service/firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  var getUser = FirebaseAuthService.firebaseUserDetail();
  
  @override
  Widget build(BuildContext context) {

    // print(getUser);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: () {
              FirebaseAuthService().firebaseLogout();
              Navigator.pushReplacementNamed(context, '/login');
            }
          )
        ],
      ),
      body: Center(
        // child: Text('${userEmail ?? getUser.phoneNumber}'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${getUser?.email ?? "..."}'),
            Text('Mobile: ${getUser?.phoneNumber ?? "..."}'),
          ],
        ),
      ),
    );
  }
}