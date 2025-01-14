import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
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
  File? selectedImage;
  @override
  void initState() {
    super.initState();

    formKey = GlobalKey<FormState>();
  }

  Future _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
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
            }
            nameController = TextEditingController(text: snapshot.data!.name);
            locationController =
                TextEditingController(text: snapshot.data!.location);

            return Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inverseSurface,
                      foregroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
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
                            //TODO: ADD AN IMAGE PICKER TO CHOOSE AN IMAGE.
                            _pickImageFromGallery();
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          controller: nameController,
                          decoration: InputDecoration(
                            alignLabelWithHint: false,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: const Text('full name'),
                            labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
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
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          controller: locationController,
                          decoration: InputDecoration(
                            alignLabelWithHint: false,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: const Text('delivery address'),
                            labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
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
            );
          },
        )),
      ),
    );
  }
}
