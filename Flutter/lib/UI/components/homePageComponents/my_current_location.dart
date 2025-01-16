import 'package:flutter/material.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key, required this.userLocation});
  final String userLocation;

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deliver to:',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary.withAlpha(200))),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.userLocation,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
