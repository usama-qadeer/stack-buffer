import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stack_buffers/firebase_work/firebase_services.dart';
import 'package:stack_buffers/screens/login_screen.dart';
import 'package:stack_buffers/widget/myButton.dart';
import 'package:stack_buffers/widget/myTextField.dart';

class SignupPage extends StatefulWidget {
  bool? formStateLoading = false;
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

TextEditingController _nameC = TextEditingController();
TextEditingController _lnameC = TextEditingController();
TextEditingController _emailC = TextEditingController();
TextEditingController _passC = TextEditingController();
TextEditingController _confirmPass = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool formStateLoding = false;

@override
void dispose() {
  _emailC.dispose();
  _nameC.dispose();
  _passC.dispose();
  _confirmPass.dispose();
  // super.dispose();
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
    if (_passC.text == _confirmPass.text) {
      setState(() {
        formStateLoding = true;
      });
      String? acctStatus =
          await FirebaseWork.createAccount(_emailC.text, _passC.text);
      if (acctStatus != null) {
        ecoDialogue(acctStatus, context);
        setState(() {
          formStateLoding = false;
        });
      } else {
        _nameC.clear();
        _emailC.clear();
        _passC.clear();
        _confirmPass.clear();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("User added sucessfully.")));
      }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const LoginPage(),
      //   ));
    }
  }
}

void setState(Null Function() param0) {}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
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
                    MyTextFormField(
                      hintText: "First Name",
                      label: "First Name ",
                      controller: _nameC,
                      validate: (v) {
                        if (v!.isEmpty || v.length < 5) {
                          return ("Enter a valid name");
                        }
                      },
                    ),
                    MyTextFormField(
                      hintText: "Last Name",
                      label: "Last Name ",
                      controller: _lnameC,
                      validate: (v) {
                        if (v!.isEmpty || v.length < 5) {
                          return ("Enter a valid name");
                        }
                      },
                    ),
                    MyTextFormField(
                      validate: (v) {
                        if (v!.isEmpty || !v.contains("@gmail.com")) {
                          return ("Enter a valid email");
                        }
                      },
                      hintText: "Email",
                      label: "Email",
                      controller: _emailC,
                    ),
                    MyTextFormField(
                      validate: (v) {
                        if (v!.isEmpty || v.length < 5) {
                          return ("Password Value should be 5 to 8 words");
                        }
                      },
                      hintText: "Enter Password",
                      label: "Enter Password",
                      controller: _passC,
                      isPass: true,
                    ),
                    MyTextFormField(
                      validate: (v) {
                        if (_passC.text != _confirmPass.text) {
                          return ("Enter Same Password");
                        }
                      },
                      hintText: "Confirm Password",
                      label: "Confirm Password",
                      controller: _confirmPass,
                      isPass: true,
                    ),
                    MyButton(
                      onPress: () {
                        setState(() {
                          formStateLoding = true;
                        });
                        submit(context);
                      },
                      buttonText: "Sign Up",
                      isLogin: false,
                      isLoading: formStateLoding,
                    ),
                  ],
                ),
              ),
              const Text("Or Signup with"),
              const SizedBox(
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
                  Text("Already have an accoun? "),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: Text(
                      "Login",
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
      ),
    );
  }
}
