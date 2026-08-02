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

      // Initial screen
      initialRoute: AppRoutes.splash,

      // Application routes
      routes: AppRoutes.routes,

      // Future enhancements:
      // navigatorKey: NavigationService.navigatorKey,
      // themeMode: ThemeMode.system,
      // darkTheme: AppTheme.darkTheme,
      // localizationsDelegates: [...],
      // supportedLocales: [...],
    );
  }
}
