
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi CV',
      theme: ThemeData(
        // Ubah primarySwatch ke warna hijau terang
        primarySwatch: Colors.lightGreen,
      ),
      home: const LoginPage(),
    );
  }
}
