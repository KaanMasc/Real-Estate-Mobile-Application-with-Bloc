import 'package:api/features/profile_page/widgets/profile_Section.dart';
import 'package:api/features/profile_page/widgets/profile_button.dart';
import 'package:api/features/profile_page/widgets/profile_main_information_card.dart';
import 'package:api/features/profile_page/widgets/profile_name.dart';
import 'package:api/features/profile_page/widgets/profile_picture.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:api/product/widgets/project_appbar.dart';
import 'package:flutter/material.dart';
import './profile_page_view_model.dart';

class ProfilePageView extends ProfilePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProjectAppBar(),
      body: Padding(
        padding: ProjectPaddings.pagepadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const ProfilePicture(),
              const SizedBox(height: 10),
              ProfileName(fulName: 'Kaan Mascon',),
              const SizedBox(height: 20),
              ProfileButton(),
              const SizedBox(height: 10),
              ProfileMainInformation(
                  additionalText: 'adfasfaadfasfasfasfaadfasfasfasfaadfasfasfasfaadfasfasfasfaadfasfasfasfaadfasfasfasfaadfasfasfasfaadfasfasfasfaadfasfasfasfasfasfa',
                  title: 'Biography',
                  onpressed: () {}),
              
              const SizedBox(height: 10),
              ProfileSection(text: 'My Ads', onpressed: () {}),
              const SizedBox(height: 10),
              ProfileSection(text: 'Settings', onpressed: () {}),
              const SizedBox(height: 10),
              ProfileSection(text: 'About Us', onpressed: () {}),
              const SizedBox(height: 10),
              ProfileSection(text: 'Log Out', onpressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
