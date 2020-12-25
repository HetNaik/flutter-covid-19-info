import 'package:covid_app/homepage.dart';
import 'package:flutter/material.dart';

import 'data.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryBlack, fontFamily: 'Circular'),
      home: HomePage()));
}
