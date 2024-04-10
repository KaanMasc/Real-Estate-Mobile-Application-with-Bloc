import 'package:flutter/material.dart';

import '../../../../product/enums/colors.dart';
import '../../../../product/utility/paddings.dart';

class FilteredIndicator extends StatefulWidget {
  const FilteredIndicator({super.key});

  @override
  State<FilteredIndicator> createState() => _FilteredIndicatorState();
}

class _FilteredIndicatorState extends State<FilteredIndicator> {
  late String _selectedOption = 'New';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTab('New', context),
          _buildTab('Nearby', context),
          _buildTab('Popular', context),
        ],
      ),
    );
  }

  Widget _buildTab(String option, BuildContext context) {
    final isSelected = option == _selectedOption;

    return Padding(
      padding: ProjectPaddings.horizontalLarge,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedOption = option; // Seçilen seçeneği güncelle
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              option,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: isSelected
                        ? ProjectColors.orange.color
                        : ProjectColors.spanishGrey.color,
                  ),
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
