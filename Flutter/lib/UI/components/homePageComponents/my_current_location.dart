import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  late TextEditingController _myTextController;
  late String locationValue;
  @override
  void initState() {
    super.initState();
    _myTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deliver to:',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary.withAlpha(200))),
          InkWell(
            onTap: () => openLocationSearchBar(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    _myTextController.text == ''
                        ? 'Pasadena,California CA 9014'
                        : locationValue,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  size: 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  openLocationSearchBar() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            title: Text(
              'Enter your location:',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            content: TextField(
              controller: _myTextController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8),
              )),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.inverseSurface),
                  )),
              TextButton(
                onPressed: () {
                  setState(() {
                    locationValue = _myTextController.text;
                  });
                  Navigator.pop(context);
                },
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ],
          );
        });
  }
}
