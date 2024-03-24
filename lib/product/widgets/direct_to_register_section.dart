// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:api/features/authentication/sign_in/sign_in_page.dart';

import 'package:flutter/material.dart';

import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/strings.dart';

import 'custom_button.dart';

class DirectRegisterSection extends StatelessWidget {
  const DirectRegisterSection({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: ProjectColors.mortarGrey.color, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 30,
              ),
              Icon(
                icon,
                size: 80,
                color: ProjectColors.orange.color,
              ),
              SizedBox(
                child: Text(ProjectStrings().loginformes,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ProjectColors.textColor.color, fontSize: 25)),
              ),
              const SizedBox(height: 5),
              CustomButton(
                title: ProjectStrings().signbuttontext,
                voidCallback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  SignInPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
