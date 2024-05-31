import 'package:final_app_flutter/resources/app_color.dart';
import 'package:flutter/material.dart';

class LineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hitText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool isClear;
  final VoidCallback? onClearPressed;
  const LineTextField({
    super.key,
    this.hitText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.isClear = false,
    this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
            hintText: hitText,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.blue),
            ),
            suffixIcon: isClear
                ? IconButton(
                    onPressed: () {
                      if (onClearPressed != null) {
                        onClearPressed!();
                      }
                    },
                    icon: Image.asset(
                      "assets/images/cancel.png",
                      width: 15,
                    ))
                : null),
      ),
    );
  }
}

class RoundTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hitText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool isClear;
  final VoidCallback? onClearPressed;
  final Widget? leftIcon;
  const RoundTextField(
      {super.key,
      required this.hitText,
      required this.controller,
      this.obscureText = false,
      this.keyboardType,
      this.isClear = false,
      this.leftIcon,
      this.onClearPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColor.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
            hintText: hitText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: leftIcon,
            suffixIcon: isClear
                ? IconButton(
                    onPressed: () {
                      if (onClearPressed != null) {
                        onClearPressed!();
                      }
                    },
                    icon: Image.asset(
                      "assets/images/cancel.png",
                      width: 15,
                    ))
                : null),
      ),
    );
  }
}
