import 'package:flutter/material.dart';

import '../../../product/utility/app_sizes.dart';
import '../../../product/utility/paddings.dart';

class ListingPageHeader extends StatelessWidget {
  const ListingPageHeader({super.key, required this.title});
  final String title;
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
            SizedBox(
                height: kToolbarHeight,
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.chevron_left_outlined,),
                  ),
                )),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Container(
              width: AppSizes.screenWidth / 6,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all()),
              child: OutlinedButton(onPressed: () {}, child: const Icon(Icons.filter)),
            ),
            const SizedBox(width: 10),
            Container(
              width: AppSizes.screenWidth / 6,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all()),
              child: OutlinedButton(
                  onPressed: () {}, child: const Icon(Icons.format_list_numbered_outlined)),
            ),
          ],
        ),
      ),
    );
  }
}
