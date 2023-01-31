import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stack_buffers/model/homeCards.dart';
import 'package:stack_buffers/screens/booking%20screen/conference_booking.dart';

class HomeCards extends StatefulWidget {
  const HomeCards({super.key});

  @override
  State<HomeCards> createState() => _HomeCardsState();
}

nextScreen(
  BuildContext context,
  String image,
) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return ConferenceBooking();
    },
  ));
}

class _HomeCardsState extends State<HomeCards> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        ...List.generate(
          homeCards.length,
          (index) => Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  nextScreen(
                    context,
                    ("${homeCards[index].image}"),
                  );
                });
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45.w,
                        height: 30.h,
                        //color: Colors.green,
                        child: Container(
                          // height: 0.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ("${homeCards[index].image}"),
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      // color: Colors.red,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "${homeCards[index].title}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
