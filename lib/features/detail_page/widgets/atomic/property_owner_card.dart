
import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';

class PropertyOwnerCard extends StatelessWidget {
  const PropertyOwnerCard({super.key});
  final String _imagePath = 'assets/images/AI_dummy_profile_picture.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ProjectColors.pagecolor.color,
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: ProjectPaddings.horizontalMedium,
        child: Row(
          children: [
        Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(_imagePath), fit: BoxFit.contain)),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Anderson Williams',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Real Estate Agent',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w100),
            )
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.message_outlined))
          ],
        ),
      ),
    );
  }
}
