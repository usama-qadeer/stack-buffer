import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stack_buffers/screens/homepage_screen.dart';
import 'package:stack_buffers/screens/login_screen.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});
  Future<FirebaseApp> intilize = Firebase.initializeApp();

  @override
  void initState() {
    Timer(Duration(seconds: 5), () {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: intilize,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("${snapshot.error}")),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot streamSnapshot) {
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(child: Text("${streamSnapshot.error}")),
                );
              }
              if (streamSnapshot.connectionState == ConnectionState.active) {
                User? user = streamSnapshot.data;
                if (user == null) {
                  return LoginPage();
                } else {
                  return HomePageScreen();
                }
              }
              return Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        "CHECKING \n AUTHENICATION...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            },
          );
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: Text(
                  "INITIALIZATION...",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
