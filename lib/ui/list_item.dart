import 'package:flutter/material.dart';

class ListItems extends StatefulWidget {
  final elements;
  final RemoveCallBack onRemoveElement;
  ListItems({this.elements, this.onRemoveElement});

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildList());
  }

  Widget _buildList() {
    return ListView.separated(
      itemCount: widget.elements.length,
      padding: EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        return _buildRow(widget.elements[i], i);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },);
  }

  Widget _buildRow(String pair, index) {
    return ListTile(
      title: Text(
          pair,
          style: _biggerFont
      ),
      trailing: FloatingActionButton(
        tooltip: 'Remove',
        child: Icon(Icons.delete),
        onPressed: () =>
        {widget.onRemoveElement(index)},
      ),
    );
  }
}

typedef RemoveCallBack = void Function(num);