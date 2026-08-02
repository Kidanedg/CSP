import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'routes/app_routes.dart';

class CSPApp extends StatelessWidget {
  const CSPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSP',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
