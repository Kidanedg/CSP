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

      // Themes
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Initial screen
      initialRoute: AppRoutes.splash,

      // Application routes
      routes: AppRoutes.routes,

      // Future enhancements
      // navigatorKey: NavigationService.navigatorKey,
      // locale: const Locale('en'),
      // localizationsDelegates: [...],
      // supportedLocales: [...],
      // builder: EasyLoading.init(),
      // onGenerateRoute: AppRoutes.onGenerateRoute,
      // onUnknownRoute: AppRoutes.unknownRoute,
    );
  }
}
