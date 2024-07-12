import 'package:flutter/material.dart';

class AddTeamDialog extends StatelessWidget {
  final Function(String) onAdd;

  AddTeamDialog({required this.onAdd});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Team'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Team Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final name = _controller.text;
            if (name.isNotEmpty) {
              onAdd(name);
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
