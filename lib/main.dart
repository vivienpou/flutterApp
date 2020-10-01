import 'ui/dialog_form.dart';
import 'ui/list_item.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Name generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final elements = ['Jean', 'René', 'Claude', 'Jeannette'];
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final myController = TextEditingController();
  bool pressed = false;
  void _addElement(element) {
    setState(() {
      elements.add(element);
    });
  }

  void _removeElement(index) {
    setState(() {
      elements.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  ListItems(elements: elements, onRemoveElement: _removeElement,),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return DialogForm(onAddElement: _addElement,);})},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma ma
    );
  }
}





