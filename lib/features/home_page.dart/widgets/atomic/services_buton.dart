// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';


class ServicesButton extends StatelessWidget {
  const ServicesButton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: ProjectPaddings.horizontalSmall,
          child: Container(
            height: MediaQuery.of(context).size.height / 18,
            width: MediaQuery.of(context).size.width * 3 / 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: [
                ProjectColors.mortarGrey.color,
                ProjectColors.spanishGrey.color
              ]),
            ),
            child: Center(
                child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: ProjectColors.white.color),
            )),
          ),
        ),
      ],
    );
  }
}
