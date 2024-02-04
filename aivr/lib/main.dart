import 'package:aivr/src/model/user_model.dart';
import 'package:aivr/src/repository/report.dart';
import 'package:aivr/src/view/laporan_baru.dart';
import 'package:aivr/src/view_model/report.dart';
import 'package:flutter/material.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aivr/src/view/home_page.dart';
import 'package:aivr/src/view/login_page.dart';
import 'package:provider/provider.dart';

void main() async {
  // load env variables
  try {
    await dotenv.load(fileName: ".env");
  } on Exception catch (e) {
    debugPrint(e as String?);
  }
  // await dotenv.load(fileName: "../../.env");
  await dotenv.load(fileName: "./.env");

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserModel()),
      ChangeNotifierProvider(create: (context) => LaporanBaruViewModel()),
    ],
    child: VisitingReportApp(),
  ));
}

class VisitingReportApp extends StatelessWidget {
  VisitingReportApp({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name:
            'home', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'laporan_baru',
        path: '/laporan_baru',
        builder: (context, state) => const LaporanBaru(),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: _scaffoldKey,
      routerConfig: _router,
      title: 'App Visiting Report',
    );
  }
}
