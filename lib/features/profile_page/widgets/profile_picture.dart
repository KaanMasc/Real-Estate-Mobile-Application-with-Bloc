import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25)),
                ),
                Positioned(
                    right: 5,
                    bottom: 5,
                    child: CircleAvatar(
                      backgroundColor: ProjectColors.orange.color,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                           color: Colors.white,
                          )),
                    ))
              ],
            );
  }
}