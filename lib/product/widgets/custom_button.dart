import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.voidCallback,
  }) : super(key: key);
  final String title;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 50,
        width: 180,
        color: ProjectColors.orange.color,
        child: TextButton(
          onPressed: voidCallback,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
