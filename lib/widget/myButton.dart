import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  String? buttonText;
  bool? isLogin;
  VoidCallback? onPress;
  bool? isLoading;
  MyButton({
    super.key,
    this.buttonText,
    this.isLogin = false,
    this.onPress,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        width: 70.w,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
              color: isLogin == false ? Colors.white : Colors.black,
            ),
            color:
                isLogin == false ? Color.fromRGBO(255, 20, 4, 1) : Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Visibility(
              visible: isLoading! ? false : true,
              child: Center(
                child: Text(
                  buttonText ?? "Button",
                  style: TextStyle(
                    color: isLogin == false ? Colors.white : Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoading!,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
