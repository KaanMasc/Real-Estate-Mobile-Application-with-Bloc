
import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';

class LocationInformationCards extends StatelessWidget {
  const LocationInformationCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: ProjectPaddings.pagepadding,
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: ProjectColors.pagecolor.color,
                maxRadius: MediaQuery.of(context).size.height / 20,
                child: Center(
                  child: Icon(
                    Icons.location_on_outlined,
                    color: ProjectColors.black.color,
                    grade: 1,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Albert Cuypstraat 456, 1073 BX Amsterdam, Netherlands",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: ProjectColors.white.color,
              border: Border.all(width: 0.2),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              const SizedBox(width: 15),
              CircleAvatar(
                backgroundColor: ProjectColors.white.color,
                maxRadius: MediaQuery.of(context).size.height / 20,
                child: Center(
                  child: Icon(
                    Icons.location_on,
                    color: ProjectColors.black.color,
                    size: 26,
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '2.5 km ',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: ' from your location',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_down_rounded),
              const SizedBox(width: 15),
            ],
          ),
        )
      ],
    );
  }
}
