import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';

class StepTwoForm extends StatefulWidget {
  const StepTwoForm({super.key});

  @override
  State<StepTwoForm> createState() => _SecondStepState();
}

class _SecondStepState extends State<StepTwoForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPaddings.pagepadding,
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: 'Title',
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  labelText: 'Description',
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
              maxLines: 20,
            ),
          ],
        ),
      ),
    );
  }
}
