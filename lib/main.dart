import 'package:flutter/material.dart';
import 'package:mobile/pages/homepage.dart';

void main(List<String> args) {
  runApp(AppContainer());
}

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: HomePage(),
    ));
  }
}
