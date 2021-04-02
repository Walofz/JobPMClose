import 'package:flutter/material.dart';

class CloseWorkFnc extends StatelessWidget {
  Future<void> alert(BuildContext context, String text) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }  

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
