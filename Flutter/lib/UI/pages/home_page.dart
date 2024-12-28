import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffddee),
        title: SafeArea(
          
          child: Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            )
          ),
        ),
      ),
      body: const Center(
        child: Text('This is the home page as you can see'),
      ),
    );
  }
}
