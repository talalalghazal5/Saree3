import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText});
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      child: TextField(
          textAlign: TextAlign.start,
          style: TextStyle(color: Color(0xff626165)),
          cursorHeight: 10,
          cursorWidth: 2,
          cursorColor: Color(0xff626165),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffB2B1B6),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xff626165),
            ),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.searchengin,
                  color: Color(0xff626165),
                )),
                 focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff626165)),
                borderRadius: BorderRadius.circular(8)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8)),
           
          )),
    );
  }
}
