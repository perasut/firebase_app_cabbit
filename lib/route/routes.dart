import 'package:firebase_app_cabbit/screen/home_screen.dart';
import 'package:firebase_app_cabbit/screen/login_screen.dart';
import 'package:firebase_app_cabbit/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

const routeLogin = '/login';
const routeRegister = '/register';
const routeHome = '/home';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case routeLogin:
        return PageTransition(
          child: LoginScreen(), 
          type: PageTransitionType.leftToRight
        );
        break;
      case routeRegister:
        return PageTransition(
          child: RegisterScreen(), 
          type: PageTransitionType.rightToLeft
        );
        break;
      case routeHome:
        return PageTransition(
          child: HomeScreen(), 
          type: PageTransitionType.rightToLeft
        );
        break;
      default:
        return PageTransition(
          child: LoginScreen(), 
          type: PageTransitionType.rightToLeft
        );
        break;
    }
  }
}