import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoEditing extends StatefulWidget {
  const InfoEditing({super.key});

  @override
  State<InfoEditing> createState() => _InfoEditingState();
}

class _InfoEditingState extends State<InfoEditing> {

  late TextEditingController nameController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Talal Alghazal');
    locationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.inverseSurface,
                    foregroundImage:
                        const NetworkImage('https://placehold.co/500x500.png'),
                    radius: 70,
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Theme.of(context).colorScheme.surface, width: 2)
                    ),
                    child: IconButton.filled(onPressed: (){
                      //TODO: ADD AN IMAGE PICKER TO CHOOSE AN IMAGE.
                    }, icon: const FaIcon(FontAwesomeIcons.pencil, size: 15,)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).colorScheme.inverseSurface)
                ),
                child: TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: nameController,
                  decoration: InputDecoration(
                    alignLabelWithHint: false,
                    label: const Text('full name'),
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 18,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).colorScheme.inverseSurface)
                ),
                child: TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: locationController,
                  decoration: InputDecoration(
                    alignLabelWithHint: false,
                    label: const Text('delivery address'),
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}