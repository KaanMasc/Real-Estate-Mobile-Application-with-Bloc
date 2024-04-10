import 'package:api/features/aPostAdPAge/listing_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/widgets/direction_text.dart';

class AdStepThree extends StatelessWidget {
  const AdStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListingProvider>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PostAdDirectionText(directionText: "Please provide details about the listing:"),
        const SizedBox(height: 10),
        MyFormField(
          label: 'PRİCE',
          onChanged: (value) {
            listProvider.setPrice(value);
          },
        ),
        const SizedBox(height: 10),
        MyFormField(
          label: 'SQFT',
          onChanged: (value) {
            listProvider.setSqft(value);
          },
        ),
        const SizedBox(height: 50),
        MyDropdownButton(
          label: 'Bedroom',
          items: List.generate(11, (index) => index),
          onChanged: (value) {
            listProvider.setBedroomCount(value);
          },
        ),
        const SizedBox(height: 20),
        MyDropdownButton(
          label: 'Bathroom',
          items: List.generate(11, (index) => index),
          onChanged: (value) {
            listProvider.setBathroomCount(value);
          },
        ),
        const SizedBox(height: 20),
        MyDropdownButton(
          label: 'Balcony Count',
          items: List.generate(11, (index) => index),
          onChanged: (value) {
            listProvider.setBalconyCount(value);
          },
        ),
        const SizedBox(height: 20),
        MyDropdownButton(
          label: 'Year Dropdown',
          items: List.generate(75, (index) => 1950 + index),
          onChanged: (value) {
            listProvider.setConstructionYeae(value);
          },
        ),
      ],
    );
  }
}

class MyFormField extends StatelessWidget {
  final String label;
  final ValueChanged<String>? onChanged;
  const MyFormField({Key? key, required this.label, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class MyDropdownButton extends StatefulWidget {
  final String label;
  final List<int> items;
  final Function(String)? onChanged;

  const MyDropdownButton({Key? key, required this.label, required this.items, this.onChanged})
      : super(key: key);

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue; // Update the selected value
        });
        widget.onChanged?.call(newValue!); // onChanged fonksiyonunu çağırın
      },
      items: [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('Please select'),
        ),
        for (var value in widget.items)
          DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(value.toString()),
          ),
      ],
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
