import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Name generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final elements = ['Jean', 'René', 'Claude', 'Jeannette'];
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final myController = TextEditingController();

  void _addElement(element) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      elements.add(element);
    });
  }

  void _removeElement(index) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      elements.removeAt(index);
    });
  }

  void _showDialog() {
    showDialog(
      context: _scaffoldKey.currentContext,
      builder: (BuildContext context) {
        // return object of type Dialog
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
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Create"),
              onPressed: () {
                _addElement(myController.text);
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Words(elements: elements, onRemoveElement: (index) {
    setState(() {
    elements.removeAt(index);
    });),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_showDialog()},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma ma
    );
  }
}

// RANDOM WORDS

class Words extends StatefulWidget {
  final elements;
  final RemoveCallBack onRemoveElement;
  Words({this.elements, this.onRemoveElement});

  @override
  _WordsState createState() => _WordsState();
}

class _WordsState extends State<Words> {
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

      // This trailing comma makes auto-formatting nicer for build methods.,
      // This trailing comma makes auto-formatting nicer for build methods.,
    );
  }
}

  typedef RemoveCallback = void Function(index);

// FORM FIELD

class FormField extends StatefulWidget {
  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: _controller,
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Create a new login'),
                  content: Text('You typed "$value".'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

