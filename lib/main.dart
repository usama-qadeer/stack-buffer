import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stack_buffers/model/homeCards.dart';
import 'package:stack_buffers/screens/booking%20screen/conference_booking.dart';
import 'package:stack_buffers/screens/homepage_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseOptions(
    apiKey: "AIzaSyA8yfSDB1-uFqv43uugLqZ-zX3eXLCMoyM",
    authDomain: "booking-app-1e731.firebaseapp.com",
    projectId: "booking-app-1e731",
    storageBucket: "booking-app-1e731.appspot.com",
    messagingSenderId: "299798123238",
    appId: "1:299798123238:web:cafbe500318685561c2127",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) {
        return MaterialApp(
          title: 'Stack Buffers',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const HomePageScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
