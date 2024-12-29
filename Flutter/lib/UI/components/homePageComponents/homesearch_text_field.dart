import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomesearchTextField extends StatelessWidget {
  const HomesearchTextField({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 250,
      child: TextField(
        textAlign: TextAlign.start,
        style: const TextStyle(color: Color(0xff626165)),
        cursorHeight: 10,
        cursorWidth: 2,
        cursorColor: const Color(0xff626165),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffB2B1B6),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff626165),
          ),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Color(0xff626165),
              )),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff626165),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
