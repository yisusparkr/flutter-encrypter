import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/home_page.dart';
import 'src/provider/encrypt_provider.dart';
import 'src/provider/desencrypt_provider.dart';
 
void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => EncryptProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DesencryptProvider(),
      ),
    ],
    
    child: MyApp()
  )
);
 
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