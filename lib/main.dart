import 'package:flutter/material.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'pages/constants.dart';
import 'pages/createUpdateLineItemView.dart';
import 'pages/transactionListView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red, textTheme: const TextTheme()),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        createOrUpdateLineItemView: (context) => const CreateOrUpdateLineItem(),
      },
    );
  }
}
