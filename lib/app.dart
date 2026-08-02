import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class CSPApp extends StatelessWidget {
  const CSPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSP',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
