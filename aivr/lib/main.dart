import 'package:flutter/material.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:go_router/go_router.dart';

import 'package:aivr/src/view/home_page.dart';
import 'package:aivr/src/view/login_page.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(VisitingReportApp()
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (context) => CartModel()),
      //     Provider(create: (context) => SomeOtherClass()),
      //   ],
      //   settingsController: settingsController,
      //   child: const MaterialApp(title: 'Aica-Indria Visiting Report', home: ,)),
      // ),
      );
}

class VisitingReportApp extends StatelessWidget {
  VisitingReportApp({Key? key}) : super(key: key);
  final _router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        name:
            'home', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
