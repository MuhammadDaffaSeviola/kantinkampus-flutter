import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

class KantinKampusApp extends StatelessWidget {
  const KantinKampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KantinKampus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text('KantinKampus'),
        ),
      ),
    );
  }
}