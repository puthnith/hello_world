import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Name",
              ),
              onChanged: (String value) {
                _name = value;
              },
            ),
            Container(
                margin: EdgeInsets.only(top: 16.0),
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(
                                  name: _name,
                                )));
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text("Greet"),
                ))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
        title: Text('Hello $name'),
      )),
    );
  }
}
