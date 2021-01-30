// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:example/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp((MaterialApp(
    home: HomePage(),
  )));
}

class HomePage extends StatelessWidget {
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
                int i = await DatabaseHelper.instance
                    .insert({DatabaseHelper.columnName: 'Saheb'});
                print('the inserted id is $i');
              },
              child: Text('insert'),
              color: Colors.grey,
            ),
            FlatButton(
              onPressed: () async {
                List<Map<String, dynamic>> queryRows =
                    await DatabaseHelper.instance.queryAll();
                print(queryRows);
              },
              child: Text('query'),
              color: Colors.green,
            ),
            FlatButton(
              onPressed: () async {
                int updatedId = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId: 12,
                  DatabaseHelper.columnName: 'Mark'
                });
                print(updatedId);
              },
              child: Text('update'),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () async {
                int rowsEffected = await DatabaseHelper.instance.delete();
                print(rowsEffected);
              },
              child: Text('delete'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
