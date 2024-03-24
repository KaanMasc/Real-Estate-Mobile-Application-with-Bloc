import 'package:flutter/material.dart';

class RealEstateWelcome extends StatelessWidget {
  const RealEstateWelcome({Key? key}) : super(key: key);

  final String _path = 'assets/images/ic_project_logo.png';
  final String welcomeText = 'Welcome to Real Estate';
  final String projectSlogan = '"With Real Estate, #YouAreTheOwner"';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.height * 2 / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_path),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.width * 2 / 3,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  welcomeText,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  child: Text(
                    projectSlogan,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ]),
        )
      ],
    );
  }
}
