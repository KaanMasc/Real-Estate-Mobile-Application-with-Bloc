import 'package:flutter/material.dart';

class StepThreePersonalInformation extends StatefulWidget {
  const StepThreePersonalInformation({Key? key}) : super(key: key);

  @override
  State<StepThreePersonalInformation> createState() =>
      _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<StepThreePersonalInformation> {
  String? _selectedGender;
  String? _selectedAge;
  String? _selectedEmploymentStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDropdownButton(
            'Gender',
            ['Male', 'Female', 'Other'],
            (value) => _selectedGender = value,
          ),
          _buildDropdownButton(
            'Age',
            ['18-24', '25-34', '35-44', '45-54', '55-64', '65+'],
            (value) => _selectedAge = value,
          ),
          _buildDropdownButton(
            'Employment Status',
            ['Employed', 'Unemployed', 'Self-Employed', 'Student', 'Retired'],
            (value) => _selectedEmploymentStatus = value,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(
      String label, List<String> options, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              onChanged(value!);
            });
          },
          value: label == 'Gender'
              ? _selectedGender
              : label == 'Age'
                  ? _selectedAge
                  : _selectedEmploymentStatus,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
