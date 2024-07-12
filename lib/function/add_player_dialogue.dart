import 'package:flutter/material.dart';

import '../model/player.dart';

class AddPlayerDialog extends StatefulWidget {
  final Function(Player) onAdd;

  AddPlayerDialog({required this.onAdd});

  @override
  _AddPlayerDialogState createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();
  final _positionController = TextEditingController();
  final _pointsController = TextEditingController();
  final _assistsController = TextEditingController();
  final _reboundsController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final player = Player(
        name: _nameController.text,
        image: _imageController.text,
        position: _positionController.text,
        pointsPerGame: double.parse(_pointsController.text),
        assistsPerGame: double.parse(_assistsController.text),
        reboundsPerGame: double.parse(_reboundsController.text),
      );
      widget.onAdd(player);
      Navigator.of(context).pop();
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Player'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the player\'s name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _positionController,
                decoration: InputDecoration(labelText: 'Position'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the player\'s position';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pointsController,
                decoration: InputDecoration(labelText: 'Points per Game'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the points per game';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _assistsController,
                decoration: InputDecoration(labelText: 'Assists per Game'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the assists per game';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _reboundsController,
                decoration: InputDecoration(labelText: 'Rebounds per Game'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the rebounds per game';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _submit,
          child: Text('Add'),
        ),
      ],
    );
  }
}
