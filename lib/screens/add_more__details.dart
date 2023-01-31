import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stack_buffers/firebase_work/firebase_services.dart';
import 'package:stack_buffers/screens/booking%20screen/conference_booking.dart';
import 'package:stack_buffers/screens/homepage_screen.dart';
import 'package:stack_buffers/widget/myButton.dart';
import 'package:stack_buffers/widget/myTextField.dart';

class AddMoreDetails extends StatefulWidget {
  const AddMoreDetails({
    super.key,
  });

  @override
  State<AddMoreDetails> createState() => _AddMoreDetailsState();
}

/* */
TextEditingController reqC = TextEditingController();
TextEditingController _nameC = TextEditingController();
TextEditingController _emailC = TextEditingController();
TextEditingController _numberC = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool newValue = false;

confirm(BuildContext context) {
  if (_formKey.currentState!.validate()) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Your booking has been confirmed!"),
            actions: [
              MyButton(
                buttonText: 'OK',
                onPress: () {
                  FirebaseWork.addData(
                    timeC.text,
                    dateC.text,
                    attendeesC.text,
                    venueC.text,
                    _nameC.text,
                    _emailC.text,
                    _numberC.text,
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePageScreen(),
                      ));
                },
              ),
            ],
          );
        });
  }
}

class _AddMoreDetailsState extends State<AddMoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Add More Details",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextFormField(
                  controller: _nameC,
                  validate: (p0) {
                    if (p0!.isEmpty) {
                      return ("Required");
                    }
                    return null;
                  },
                  hintText: "Enter Your Name",
                  label: "Name",
                ),
                MyTextFormField(
                  controller: _emailC,
                  validate: (p0) {
                    if (p0!.isEmpty) {
                      return ("Enter a valid email");
                    }
                    return null;
                  },
                  hintText: "Enter your Email",
                  label: "Email",
                ),
                MyTextFormField(
                  controller: _numberC,
                  validate: (p0) {
                    if (p0!.isEmpty) {
                      return ("Required");
                    }
                    return null;
                  },
                  hintText: "Enter your Phone number",
                  label: "Number",
                ),
                Row(
                  children: [
                    Container(
                      width: 70.w,
                      child: CheckboxListTile(
                        selectedTileColor: Colors.red,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.red,
                        value: newValue,
                        onChanged: (value) {
                          setState(() {
                            newValue = value!;
                          });
                        },
                        title: const Text(
                            "Request a call from your project manager"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 70.w,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: newValue,
                        onChanged: (value) {
                          setState(() {
                            newValue = value!;
                          });
                        },
                        title: const Text("Request more AV option"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MyButton(
            onPress: () {
              setState(() {
                confirm(context);
              });
            },
            buttonText: "Confirm Booking",
          )
        ],
      ),
    );
  }
}
