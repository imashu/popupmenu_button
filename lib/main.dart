import 'package:flutter/material.dart';
//import 'dart:async';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Animals { Cats, Dogs, Bird, Lizard, Fish }

class _MyAppState extends State<MyApp> {
  Animals _selected = Animals.Cats;
  String _value = 'Make a Selection';
  final List<PopupMenuEntry<Animals>> _items = <PopupMenuEntry<Animals>>[];

  //

  @override
  void initState() {
    for (Animals animals in Animals.values) {
      _items.add(PopupMenuItem(
        child: Text(
          _getdisplay(animals),
        ),
        value: animals,
      ));
    }

    super.initState();
  }

  void _onselected(Animals animals) {
    setState(() {
      _selected = animals;
      _value = 'You Selected ${_getdisplay(animals)}';
    });
  }

  String _getdisplay(Animals animals) {
    int index = animals.toString().indexOf('.');
    index++;
    return animals.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pop Menu button'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(_value),
              ),
              PopupMenuButton<Animals>(
                  child: const Icon(Icons.input),
                  initialValue: Animals.Cats,
                  onSelected: _onselected,
                  itemBuilder: (BuildContext context) {
                    return _items;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
