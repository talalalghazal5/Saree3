import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/pages/home_page.dart';
import 'package:saree3/UI/pages/login_or_register.dart';
import 'package:saree3/controllers/user_controller.dart';
import 'package:saree3/services/auth_services.dart';
import 'package:saree3/services/profile_services.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ProfileServices().profile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Just a moment please')
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              if (snapshot.error.toString() == 'Unauthenticated') {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: const Text('Session expired, please login again'),
                      actions: [
                        TextButton(
                          onPressed: () => AuthServices().logout(),
                          child: const Text('Logout'),
                        )
                      ],
                    ),
                  );
                });
              }
              return Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Error occured',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text('Retry'),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Provider.of<UserController>(context, listen: false).user =
                  snapshot.data!;
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            });
            return Container();
          }),
    );
  }
}
