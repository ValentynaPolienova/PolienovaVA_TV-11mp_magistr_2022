import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final Function note;

  Note(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              "Note: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            child: note(context, TextStyle(fontSize: 17, fontStyle: FontStyle.italic, color: Colors.black))
          ),
        ],
      ),
    );
  }
}
