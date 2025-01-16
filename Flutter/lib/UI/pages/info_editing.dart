import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saree3/controllers/image_controller.dart';
import 'package:saree3/controllers/user_controller.dart';
import 'package:saree3/services/auth_services.dart';
import 'package:saree3/services/profile_services.dart';

class InfoEditing extends StatefulWidget {
  const InfoEditing({super.key});

  @override
  State<InfoEditing> createState() => _InfoEditingState();
}

class _InfoEditingState extends State<InfoEditing> {
  late TextEditingController nameController;
  late TextEditingController locationController;
  late GlobalKey<FormState> formKey;
  late String name;
  late String location;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    locationController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    locationController.dispose();
  }

  void _updateProfile() async {
    ImageController imageProvider =
        Provider.of<ImageController>(context, listen: false);
    UserController userController =
        Provider.of<UserController>(context, listen: false);
    try {
      setState(() {
        _isLoading = true;
      });
      await ProfileServices().updateProfile(
        imageProvider.selectedImage,
        nameController.text,
        locationController.text,
      );
      userController.user = await ProfileServices().profile();
    } on TimeoutException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Information updated')));
      Navigator.popAndPushNamed(context, '/settingsPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageController imageProvider = Provider.of<ImageController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/settingsPage'),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSurface,
            )),
        actions: [
          IconButton(
            onPressed: () {
              _updateProfile();
            },
            icon: FaIcon(
              FontAwesomeIcons.check,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: FutureBuilder(
          future: ProfileServices().profile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LinearProgressIndicator());
            } else if (snapshot.data == null) {
              return const Center(child: Text('no data'));
            } else if (snapshot.hasError) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text(
                      'Your session has expired, please login again'),
                  actions: [
                    TextButton(
                      onPressed: () => AuthServices().logout(),
                      child: Text(
                        'Logout',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (nameController.text.isEmpty) {
              nameController.text = snapshot.data!.name!;
            }
            if (locationController.text.isEmpty) {
              locationController.text = snapshot.data!.location!;
            }
            return Stack(alignment: Alignment.center, children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.inverseSurface,
                        foregroundImage: imageProvider.selectedImage != null
                            ? FileImage(imageProvider.selectedImage!)
                            : NetworkImage(snapshot.data!.profilePictureUrl!),
                        radius: 70,
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.surface,
                                width: 2)),
                        child: IconButton.filled(
                            onPressed: () {
                              imageProvider.pickImageFromGallery();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.pencil,
                              size: 15,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface)),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            controller: nameController,
                            onSaved: (newValue) =>
                                nameController.text = newValue!,
                            onChanged: (value) {
                              name = value;
                            },
                            decoration: InputDecoration(
                              alignLabelWithHint: false,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: const Text('full name'),
                              labelStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                              ),
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The name should not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                          ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            controller: locationController,
                            onSaved: (newValue) =>
                                nameController.text = newValue!,
                            onChanged: (value) {
                              location = value;
                            },
                            decoration: InputDecoration(
                              alignLabelWithHint: false,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: const Text('delivery address'),
                              labelStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a location address';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              if (_isLoading)
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ]);
          },
        )),
      ),
    );
  }
}
