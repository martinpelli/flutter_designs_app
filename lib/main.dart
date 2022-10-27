import 'package:flutter/material.dart';
import 'package:flutter_designs_app/src/pages/emergency_page.dart';

//import 'src/pages/slideshow_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Designs App', home: EmergencyPage());
  }
}
