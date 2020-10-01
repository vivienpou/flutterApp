import 'package:flutter/material.dart';

class DialogForm extends StatefulWidget {
  final AddCallBack onAddElement;
  DialogForm({this.onAddElement});
  @override
  _DialogFormState createState() => _DialogFormState();
}

class _DialogFormState extends State<DialogForm> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: new Text("Create new login"),
        content: new TextField(
          controller: myController,
          decoration: InputDecoration(
            hintText: 'Start typing',
            border: const OutlineInputBorder(),
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Create"),
            onPressed: () {
              widget.onAddElement(myController.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}
typedef AddCallBack = void Function(String);