import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stack_buffers/firebase_work/firebase_services.dart';
import 'package:stack_buffers/screens/profile_screen.dart';

import '../widget/home_cards.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              height: 50.h,
              width: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/logo.jpg",
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.menu),
                  color: Colors.red,
                ),
              ],
            ),
            Divider(
              height: 10.h,
              color: Colors.red.withOpacity(0.5),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.person),
                iconColor: Colors.red,
                title: Text("Profile"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShowData(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.calendar_month),
                iconColor: Colors.red,
                title: Text("Your Booking"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.settings),
                iconColor: Colors.red,
                title: Text("Setting"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.info),
                iconColor: Colors.red,
                title: Text("About Us"),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    FirebaseWork.signOut();
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: Text("Sign Out"),
                  ),
                )
              ],
            )
          ]),
        ),
        body: const HomeCards());
  }
}
