import 'package:app_quan_ly_chi_tieu/screens/dashboard.dart';
import 'package:app_quan_ly_chi_tieu/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return LoginView();
        }
        return Dashboard();
      }
    );
  }
}
