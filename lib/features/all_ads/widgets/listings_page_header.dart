import 'package:flutter/material.dart';

import '../../../product/utility/app_sizes.dart';
import '../../../product/utility/paddings.dart';

class ListingPageHeader extends StatelessWidget {
  const ListingPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      width: AppSizes.screenWidth,
      child: Padding(
        padding: ProjectPaddings.pagepadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left_outlined, size: 25,)),
            Text(
              "All Listings ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Container(
              width: AppSizes.screenWidth / 6,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all()),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.filter)),
            ),
            const SizedBox(width: 10),
            Container(
              width: AppSizes.screenWidth / 6,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all()),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.format_list_numbered_outlined)),
            ),
          ],
        ),
      ),
    );
  }
}
