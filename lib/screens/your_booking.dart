import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class YourBooking extends StatelessWidget {
  const YourBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("data").snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 70,
                child: Text(snapshot.data!.docs[index]['time']),
              );
            },
          );
        },
      ),
    );
  }
}
