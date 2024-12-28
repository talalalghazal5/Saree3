import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.width, required this.buttonName});
  String buttonName;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xff3D21DB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(
            color: Color(0xffFFFFF7),
          ),
        ),
      ),
    );
  }
}
