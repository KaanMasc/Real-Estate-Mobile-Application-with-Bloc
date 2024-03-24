import 'package:flutter/material.dart';

import '../widgets/atomic/post_question_box.dart';

class StepThreeForm extends StatefulWidget {
  const StepThreeForm({super.key});

  @override
  State<StepThreeForm> createState() => _StepThreeFormState();
}

class _StepThreeFormState extends State<StepThreeForm> {
  TextEditingController _priceController = TextEditingController();
  TextEditingController _sqftconttroller = TextEditingController();

  String _balconyCount = '';
  String _bathroomCount = '';
  String _bedroomCount = '';
  String _constructionYear = '';
  String _sqft = '';
  String? selectedValue;

  @override
  void dispose() {
    _priceController.dispose();
    _sqftconttroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             PostQuestionBox(
              text: "Please fill in the property details.",
            ),
            _buildTextField(
                'Price', _priceController, TextInputType.number, 'Enter price'),
            _buildTextField(
                'Sqft', _sqftconttroller, TextInputType.number, 'Enter Sgft '),
            const SizedBox(height: 20),
            _buildDropdownButton(
                'Balcony Count',
                List.generate(10, (index) => (index).toString()),
                (value) => _balconyCount = value),
            _buildDropdownButton(
                'Bathroom Count',
                List.generate(10, (index) => (index).toString()),
                (value) => _bathroomCount = value),
            _buildDropdownButton(
                'Bedroom Count',
                List.generate(10, (index) => (index).toString()),
                (value) => _bedroomCount = value),
            _buildYearDropdownButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      TextInputType inputType, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          label,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
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
          value: selectedValue,
        ),
      ],
    );
  }

  Widget _buildYearDropdownButton() {
    List<String> years =
        List.generate(2024 - 1950 + 1, (index) => (1950 + index).toString());
    return _buildDropdownButton(
        'Construction Year', years, (value) => _constructionYear = value);
  }
}
