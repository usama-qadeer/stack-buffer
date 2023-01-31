// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stack_buffers/screens/add_more__details.dart';
import 'package:stack_buffers/widget/myButton.dart';
import 'package:stack_buffers/widget/myTextField.dart';

class ConferenceBooking extends StatefulWidget {
  const ConferenceBooking({super.key});

  @override
  State<ConferenceBooking> createState() => _ConferenceBookingState();
}

TextEditingController dateC = TextEditingController();
TextEditingController timeC = TextEditingController();
TextEditingController attendeesC = TextEditingController();
TextEditingController venueC = TextEditingController();

final formKey = GlobalKey<FormState>();

String? uid;
String? email;

moreInfo(BuildContext context) {
  if (formKey.currentState!.validate()) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddMoreDetails(),
        ));
  }
}

class _ConferenceBookingState extends State<ConferenceBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40.h,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/conference.jpg"),
                ),
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      showCursor: false,
                      controller: dateC,

                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        hintText: "Select Date",
                        // border: const OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2075));
                        setState(() {
                          if (dateC.text != null) {
                            dateC.text =
                                "${date!.year}-${date.month}-${date.day}";
                          }
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.black,
                    child: TextFormField(
                      showCursor: false,
                      controller: timeC,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        hintText: "Select Time",
                        border: InputBorder.none,
                        //  border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () async {
                        var time = await showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 00, minute: 00));

                        setState(() {
                          if (timeC.text != null) {
                            timeC.text = "${time!.hour}:${time.minute}";
                          }
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      showCursor: false,
                      controller: attendeesC,
                      readOnly: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        hintText: "No of Attendes",
                        //  border: OutlineInputBorder(),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: 30.h,
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Attendees Count"),
                                    ),
                                    MyTextFormField(
                                      controller: attendeesC,
                                      hintText: ("e.g: 16"),
                                      label: "Count",
                                    ),
                                    MyButton(
                                      onPress: () {
                                        Navigator.pop(context, attendeesC.text);
                                      },
                                      buttonText: "Add",
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    child: TextFormField(
                      showCursor: false,
                      controller: venueC,
                      readOnly: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        hintText: "Venue",
                        // border: OutlineInputBorder(),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: 30.h,
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Enter Venue"),
                                    ),
                                    MyTextFormField(
                                      controller: venueC,
                                      hintText: ("Venue"),
                                      label: "Venue",
                                    ),
                                    MyButton(
                                      onPress: () {
                                        Navigator.pop(context, venueC.text);
                                      },
                                      buttonText: "Add",
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: MyButton(
                    onPress: () {
                      moreInfo(context);
                    },
                    buttonText: "Next",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
