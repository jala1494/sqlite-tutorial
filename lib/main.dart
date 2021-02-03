// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp((MaterialApp(
    home: HomePage(),
  )));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int a = 1;
  int b = 50;
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    print('_load');
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
      a = (prefs.getInt('a') ?? 0);
      b = (prefs.getInt('b') ?? 0);
    });
  }

  _saveCounter() async {
    print('saveCounter');
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('counter', _counter);
      prefs.setInt('a', a);
      prefs.setInt('b', b);
    });
  }

  increa(int i) async {
    setState(() {
      if (i == a) {
        print('it A');
        i++;
      }
      if (i == b) {
        print('it B');
        i++;
      }
      _saveCounter();
    });
  }

  void _increase() {
    setState(() {
      _counter++;
      print('plus counter');
      _saveCounter();
    });
  }

  String _test(int a) {
    return (a * 100).toString();
  }

  void _set(int a) {
    print('hi Iam $a');
  }

  void increase() {
    setState(() {
      b++;
    });
    print('$b is working');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqlite tutorial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _increase();
              },
              child: Text('$_counter'),
              color: Colors.grey,
            ),
            Text(_test(_counter)),
            FlatButton(
                onPressed: () {
                  setState(() {
                    a++;
                  });
                },
                child: Text('$a')),
            FlatButton(
                onPressed: () {
                  setState(() {
                    b++;
                  });
                },
                child: Text('$b')),
            FloatingActionButton(
                child: Text('save'),
                onPressed: () {
                  _saveCounter();
                })
          ],
        ),
      ),
    );
  }
}
