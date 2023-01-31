import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String? hintText;
  String? label;
  TextEditingController? controller;
  String? Function(String?)? validate;
  bool isPass;
  MyTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.validate,
    this.isPass = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPass == false ? isPass : isPass == true,
      controller: controller,
      validator: validate,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        hintText: hintText ?? "Null",
        label: Text("${label}"),
        labelStyle: TextStyle(color: Colors.red),
        contentPadding: const EdgeInsets.all(20),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
