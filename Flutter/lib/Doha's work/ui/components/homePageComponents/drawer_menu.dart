import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'saree3',
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 130, 136, 141)),
            ),
            IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed: () {
              },
            ),
            ListTile(
              title: Text('about'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
  }
}