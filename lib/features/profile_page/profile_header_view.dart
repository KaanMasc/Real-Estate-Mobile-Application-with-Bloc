import 'dart:io';
import 'package:api/product/services/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../product/enums/colors.dart';
import '../../../product/utility/app_sizes.dart';

class ProfilePictureSection extends StatelessWidget {
  const ProfilePictureSection({
    Key? key,
    required this.userRepo,
    required this.uid,
    required this.photoURL,
  }) : super(key: key);

  final IUserRepository userRepo;
  final String uid;
  final String photoURL;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      await userRepo.updateProfilePicture(uid, file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSizes.screenWidth / 3,
          width: AppSizes.screenWidth / 3,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: NetworkImage(
                    photoURL,
                  ),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: CircleAvatar(
            backgroundColor: ProjectColors.orange.color,
            child: IconButton(
              onPressed: () async {
                pickImage(ImageSource.gallery);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
