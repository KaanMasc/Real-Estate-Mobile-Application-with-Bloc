import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
            color: ProjectColors.orange.color,
            borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: () {},
          child: Text('Add Location',
              style: Theme.of(context).textTheme.bodyMedium),
        ));
  }
}
