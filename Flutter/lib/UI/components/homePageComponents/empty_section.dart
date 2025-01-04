import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptySection extends StatelessWidget {
  const EmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/svgs/empty.svg',
          width: 300,
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          'No data available',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
        ),
      ],
    );
  }
}
