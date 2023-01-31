import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:stack_buffers/firebase_work/firebase_services.dart';
import 'package:stack_buffers/screens/homepage_screen.dart';
import 'package:stack_buffers/screens/signup_screen.dart';
import 'package:stack_buffers/widget/myButton.dart';
import 'package:stack_buffers/widget/myTextField.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();
  bool formStateLoding = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  Future<void> ecoDialogue(String error, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(error),
            actions: [
              MyButton(
                buttonText: 'CLOSE',
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        formStateLoding = true;
      });
      String? acctStatus =
          await FirebaseWork.signAccount(_emailC.text, _passC.text);
      if (acctStatus != null) {
        ecoDialogue(acctStatus, context);
        setState(() {
          formStateLoding = false;
        });
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomePageScreen();
          },
        ));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("User login succcessfully.")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: MyTextFormField(
                      validate: (p0) {
                        if (p0!.isEmpty || p0.length < 5) {
                          return ("Enter a valid email");
                        }
                      },
                      controller: _emailC,
                      hintText: "Enter Email",
                      label: "Enter Email",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: MyTextFormField(
                      isPass: true,
                      controller: _passC,
                      hintText: "Enter Password",
                      label: "Enter Password",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MyButton(
                    isLoading: formStateLoding,
                    onPress: () {
                      submit(context);
                    },
                    buttonText: "Login",
                    isLogin: false,
                  ),
                ],
              ),
            ),
            Text("Or Login with"),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text(
                  "Facebook",
                  style: TextStyle(
                    color: Colors.red.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Container(
                      child: Text("or"),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    "Google",
                    style: TextStyle(
                      color: Colors.red.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do not have an accoun? "),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
