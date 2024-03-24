// ignore_for_file: public_member_api_docs, 
import 'package:flutter/material.dart';

import 'package:api/product/enums/colors.dart';

class FavoriteListTile extends StatelessWidget {
  const FavoriteListTile({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/ic_home_picture.jpg'))),
            ),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: ProjectColors.black.color),
                ),
                Text(
                  'Click to see favorites in this list.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: ProjectColors.mortarGrey.color),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
