import 'package:flutter/material.dart';

import 'package:api/product/enums/colors.dart';

class PropertyInformationBox extends StatelessWidget {
  const PropertyInformationBox({
    Key? key,
    required this.number,
    required this.icon,
  }) : super(key: key);
  final String number;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ProjectColors.pagecolor.color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
          ),
          Text(number, style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
