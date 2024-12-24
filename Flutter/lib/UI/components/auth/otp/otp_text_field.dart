import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otptextfield extends StatefulWidget {
  const Otptextfield({super.key});

  @override
  _OtptextfieldState createState() => _OtptextfieldState();
}

class _OtptextfieldState extends State<Otptextfield> {
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 50,
            width: 40,
            child: TextFormField(
              controller: _controllers[index],
              onChanged: (value) {
                if (value.length == 1) {
                  if (index < 3) {
                    FocusScope.of(context).nextFocus();
                  }
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.inverseSurface.withAlpha(100),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              style: const TextStyle(
                fontSize: 20 
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1), 
                FilteringTextInputFormatter.digitsOnly, 
              ],
            ),
          ),
        );
      }),
    );
  }
}
