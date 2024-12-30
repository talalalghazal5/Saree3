import 'package:flutter/material.dart';

class QuantitySelectorButton extends StatefulWidget {
  const QuantitySelectorButton({super.key});

  @override
  State<QuantitySelectorButton> createState() => _QuantitySelectorButtonState();
}

class _QuantitySelectorButtonState extends State<QuantitySelectorButton> {
  int _value = 0;
  void _increaseValue() {
    setState(() {
      _value++;
    });
  }

  void _decreaseValue() {
    setState(() {
      _value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 60,
      child: Row(
        children: [
          GestureDetector(
            onTap: _decreaseValue,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xffB2B1B6),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: const Center(
                child: Text(
                  '-',
                  style: TextStyle(color: Color(0xff25242B)),
                ),
              ),
            ),
          ),
          SizedBox(
          height: 20,
          width: 20,
          child: TextField(
            style: const TextStyle(fontSize: 15
            ),
            controller: TextEditingController(text: _value.toString()),
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              filled: true,
            fillColor:Color(0xffB2B1B6),
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.zero
              ),
              contentPadding: EdgeInsets.symmetric(vertical:0 ),
            ),
          ),
        ),
          GestureDetector(
            onTap: _increaseValue,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  color: Color(0xffB2B1B6),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(color: Color(0xff25242B)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
