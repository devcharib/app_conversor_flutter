//metodo principal
import 'package:flutter/material.dart';
import 'package:flutter_app_conversor/app/views/home_view.dart';

void main() {
  runApp(AppWidget());
}

//classe App
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
