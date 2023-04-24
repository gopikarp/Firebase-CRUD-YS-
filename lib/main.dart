import 'package:firebase_core/firebase_core.dart';
import 'package:firebasepro/screen/add.dart';
import 'package:firebasepro/screen/home.dart';
import 'package:firebasepro/screen/update.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
      initialRoute: '/',
      routes: {
        '/adds': (context) => add(),
        '/update': (context) => update(),
      },
    );
  }
}
