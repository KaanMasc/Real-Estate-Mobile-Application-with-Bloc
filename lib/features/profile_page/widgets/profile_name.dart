import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({
    Key? key,
    required this.fulName,
    required this.onTap,
  }) : super(key: key);

  final String fulName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            fulName,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 4),
        Text('Real Estate Manager',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ProjectColors.spanishGrey.color)),
      ],
    );
  }
}
