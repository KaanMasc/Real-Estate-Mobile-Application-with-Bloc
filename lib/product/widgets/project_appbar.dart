import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Container(
          height: kToolbarHeight,
          width: MediaQuery.of(context).size.width / 3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/ic_project_logo.png'),
                  fit: BoxFit.cover)),
        ),
        const Spacer(),
        Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
              color: ProjectColors.spanishGrey.color, shape: BoxShape.circle),
          child: IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: ProjectPaddings.horizontalMedium,
          child: Container(
            height: kToolbarHeight,
            decoration: BoxDecoration(
                color: ProjectColors.spanishGrey.color, shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
