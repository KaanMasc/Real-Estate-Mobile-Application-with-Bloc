import 'package:flutter/material.dart';
import '../../../product/enums/colors.dart';
import '../../../product/utility/app_sizes.dart';
import '../../../product/utility/paddings.dart';

class ProfileBiographyBox extends StatelessWidget {
  const ProfileBiographyBox({
    Key? key,
    required this.title,
    required this.additionalText,
    required this.onpressed,
  }) : super(key: key);

  final String title;
  final String additionalText;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight / 8,
      width: AppSizes.screenWidth,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: ProjectPaddings.horizontalMedium,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: ProjectColors.spanishGrey.color),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _getDisplayText(additionalText),
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onpressed,
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDisplayText(String text) {
    if (text.length <= 110) {
      return text;
    } else {
      return '${text.substring(0, 110)}...';
    }
  }
}
