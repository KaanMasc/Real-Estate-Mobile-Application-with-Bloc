// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.onpressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onpressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 400,
      decoration: BoxDecoration(
          color: ProjectColors.pagecolor.color,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 100, child: Text(text)),
          const SizedBox(
            width: 200,
          ),
          IconButton(
              onPressed: onpressed,
              icon: const Icon(Icons.chevron_right_rounded))
        ],
      ),
    );
  }
}
