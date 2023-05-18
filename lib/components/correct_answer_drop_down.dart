import 'package:flutter/material.dart';

class CorrectAnswerDropDown extends StatelessWidget {
  final int dropDownValue;
  final Function(int?) onChanged;

  const CorrectAnswerDropDown({
    super.key,
    required this.dropDownValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Text(
        'Select the correct Answer',
        style: TextStyle(fontSize: 24),
      ),
      title: DropdownButton(
        isExpanded: true,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 25,
        ),
        value: dropDownValue,
        items: const [
          DropdownMenuItem(
            value: 1,
            child: Center(child: Text('A', textAlign: TextAlign.center)),
          ),
          DropdownMenuItem(
            value: 2,
            child: Center(child: Text('B', textAlign: TextAlign.center)),
          ),
          DropdownMenuItem(
            value: 3,
            child: Center(child: Text('C', textAlign: TextAlign.center)),
          ),
          DropdownMenuItem(
            value: 4,
            child: Center(child: Text('D', textAlign: TextAlign.center)),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
