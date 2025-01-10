import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('\$0.99', style: Theme.of(context).textTheme.bodyMedium,),
              Text('Delivery fees',style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          Container(
            width: 1,
            height: 50,
            color: Theme.of(context).colorScheme.inverseSurface.withAlpha(100),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('15-30 mins', style: Theme.of(context).textTheme.bodyMedium,),
              Text('Delivery time',style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
        ],
      ),
    );
  }
}