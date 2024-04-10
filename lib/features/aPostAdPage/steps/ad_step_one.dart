import 'package:api/features/aPostAdPAge/widget/widgets/direction_text.dart';
import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api/features/aPostAdPAge/listing_provider.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:api/product/utility/paddings.dart';


class AdStepOne extends StatelessWidget {
  AdStepOne({Key? key}) : super(key: key);
  final List<String> _options = [
    "I want to sell my Property",
    "I want to rent out my Property,",
    "ı want to rent out my Room",
    "I'am looking for Roommate",
  ];
  final String _directionText = "Please Select Your Ad Type";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostAdDirectionText(directionText: _directionText),
        Expanded(
          child: Consumer<ListingProvider>(
            builder: (context, listProvider, _) {
              return ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: ProjectPaddings.verticalPaddingMedium,
                    child: GestureDetector(
                      onTap: () {
                        listProvider.selectCcategoryID(index + 1);
                      },
                      child: Container(
                        height: AppSizes.screenHeight / 12,
                        width: AppSizes.screenWidth,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(25),
                          color: listProvider.categoryId == index + 1 ? Colors.green : Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _options[index],
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: listProvider.categoryId == index + 1
                                    ? ProjectColors.white.color
                                    : ProjectColors.black.color,
                              ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
