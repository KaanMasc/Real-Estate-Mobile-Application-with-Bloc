import 'package:api/features/profile_page/mixin_profile_edit.dart';
import 'package:api/features/profile_page/profile_header_view.dart';
import 'package:api/features/profile_page/widgets/profile_Section.dart';
import 'package:api/features/profile_page/widgets/profile_biography_card.dart';
import 'package:api/features/profile_page/widgets/profile_button.dart';
import 'package:api/features/profile_page/widgets/profile_main_information_card.dart';
import 'package:api/features/profile_page/widgets/profile_name.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:api/product/widgets/project_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../product/model/user_model.dart';
import './profile_page_view_model.dart';

class ProfilePageView extends ProfilePageViewModel with ProfileEdit {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser != null ? currentUser.uid : '';
    return Scaffold(
      appBar: const ProjectAppBar(),
      body: Padding(
        padding: ProjectPaddings.pagepadding,
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: userRepository.getUserData(uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator.adaptive();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final UserModel? userModel = snapshot.data;
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      if (userModel?.photoURL != null)
                        ProfilePictureSection(
                            photoURL: userModel!.photoURL, userRepo: userRepository, uid: uid)
                      else
                        Image.asset('assets/images/aa.png'),
                      const SizedBox(height: 10),
                      ProfileName(
                        fulName: userModel?.fullName ?? '',
                        onTap: () {
                          editField('Biography', context).then((newValue) {
                            if (newValue != null) {
                              userRepository.updateFullName(uid, newValue);
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      ProfileButton(
                        onPressed: () {},
                      ),
                      const SizedBox(height: 10),
                      ProfileBiographyBox(
                          additionalText: userModel?.bio ?? '',
                          title: 'Biography',
                          onpressed: () {
                            editField('Biography', context).then((newValue) {
                              if (newValue != null) {
                                userRepository.updateBio(uid, newValue);
                              }
                            });
                          }),
                      const SizedBox(height: 10),
                      ProfileMainInformation(
                        title: "E-Mail",
                        information: userModel?.email ?? '',
                        onpressed: () {},
                      ),
                      const SizedBox(height: 10),
                      ProfileMainInformation(
                        title: "Password",
                        information: "********",
                        onpressed: () {},
                      ),
                      const SizedBox(height: 10),
                      ProfileSection(text: 'My Ads', onpressed: () {}),
                      const SizedBox(height: 10),
                      ProfileSection(text: 'Settings', onpressed: () {}),
                      const SizedBox(height: 10),
                      ProfileSection(text: 'About Us', onpressed: () {}),
                      const SizedBox(height: 10),
                      ProfileSection(text: 'Log Out', onpressed: () {}),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
