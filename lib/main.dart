import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'providers/app_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/theme_provider.dart';

/// Entry point of the Community Social Platform (CSP).
Future<void> main() async {
  // Ensure Flutter engine is initialized before using plugins.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for the current platform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Launch the application with global providers.
  runApp(
    MultiProvider(
      providers: [
        // Application theme (Light/Dark)
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),

        // User authentication and session
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),

        // Global application state
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
        ),
      ],
      child: const CSPApp(),
    ),
  );
}
