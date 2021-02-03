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
    });
  }

  _saveCounter() async {
    print('saveCounter');
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('counter', _counter);
    });
  }

  void _increase() {
    setState(() {
      _counter++;
      _saveCounter();
    });
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
              onPressed: () async {
                _increase();
              },
              child: Text('$_counter'),
              color: Colors.grey,
            ),
            FlatButton(onPressed: () {}, child: Text('$a'))
          ],
        ),
      ),
    );
  }
}
