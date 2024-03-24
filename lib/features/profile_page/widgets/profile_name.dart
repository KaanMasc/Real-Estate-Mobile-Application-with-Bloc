import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({
    Key? key, required this.fulName,
  }) : super(key: key);

  final String fulName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          fulName,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
            height:
                4),
         Text(
          'Real Estate Manager',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ProjectColors.spanishGrey.color)
        ),
      ],
    );
  }
}
