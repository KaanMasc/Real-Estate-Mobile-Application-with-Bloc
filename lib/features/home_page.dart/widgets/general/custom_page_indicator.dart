
import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  final Function(String) onTabChanged;
  final String selectedOption;

  const CustomPageIndicator({
    super.key,
    required this.onTabChanged,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildTab('New', context, selectedOption == 'New'),
          buildTab('Nearby', context, selectedOption == 'Nearby'),
          buildTab('Popular', context, selectedOption == 'Popular'),
        ],
      ),
    );
  }

  Widget buildTab(String option, BuildContext context, bool isSelected) {
    return Padding(
      padding: ProjectPaddings.horizontalLarge,
      child: GestureDetector(
        onTap: () => onTabChanged(option),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              option,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: isSelected ? ProjectColors.orange.color : ProjectColors.spanishGrey.color
              )
            ),
            if (isSelected)
              Positioned(
                top: 2.0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ProjectColors.orange.color,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
