import 'package:flutter/material.dart';
import 'package:encrypter/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Encrypter',
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage()
      },
      theme: ThemeData.dark(),
    );
  }
}