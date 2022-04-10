import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double radius;
  final double? height;
  final Widget? buttonIcon;
  final double? fontSize;
  final double padding;
  final VoidCallback onPressed;

  const SocialLoginButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.buttonColor,
      this.textColor,
      this.radius = 0,
      this.fontSize,
      this.height = 40,
      this.padding = 0,
      this.buttonIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              onPrimary: textColor,
              primary: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              buttonIcon ??
                  const Opacity(
                    opacity: 0,
                    child: Icon(Icons.email),
                  ),
              const Spacer(),
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
