import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTeamDialog extends StatelessWidget {
  final Function(String) onAdd;

  AddTeamDialog({required this.onAdd});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment:Alignment.topCenter,
      backgroundColor: Colors.white,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
      title: Text('Add Team',style: GoogleFonts.inter(fontWeight: FontWeight.w700),),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Team Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel',style: GoogleFonts.inter(color:  Color(0xff0076FF),fontWeight: FontWeight.w600)),
        ),
        TextButton(
          onPressed: () {
            final name = _controller.text;
            if (name.isNotEmpty) {
              onAdd(name);
              Navigator.of(context).pop();
            }
          },
          child: Text('Add',style: GoogleFonts.inter(color:  Color(0xff0076FF),fontWeight: FontWeight.w600),),
        ),
      ],
    );
  }
}
