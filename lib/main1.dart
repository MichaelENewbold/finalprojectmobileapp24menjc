// -----------------------------------------------------------------------
// Filename: main.dart
// Original Author: Dan Grissom
// Creation Date: 5/18/2024
// Copyright: (c) 2024 CSC322
// Description: This file is the main entry point for the app and
//              initializes the app and the router.

//////////////////////////////////////////////////////////////////////////
// Imports
//////////////////////////////////////////////////////////////////////////
// Dart imports

// Flutter external package imports
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// App relative file imports
import 'screens/general/screen_alternate.dart';
import 'screens/general/screen_home.dart';
import 'widgets/navigation/widget_primary_scaffold.dart';
import 'screens/auth/screen_login_validation.dart';
import 'screens/settings/screen_profile_edit.dart';
import 'providers/provider_user_profile.dart';
import 'screens/settings/screen_settings.dart';
import 'providers/provider_auth.dart';
import 'providers/provider_tts.dart';
import 'util/file/util_file.dart';
import 'firebase_options.dart';
import 'theme/theme.dart';

//////////////////////////////////////////////////////////////////////////
// Providers
//////////////////////////////////////////////////////////////////////////
// Create a ProviderContainer to hold the providers
final ProviderContainer providerContainer = ProviderContainer();

// Create providers
final providerUserProfile = ChangeNotifierProvider<ProviderUserProfile>((ref) => ProviderUserProfile());
final providerAuth = ChangeNotifierProvider<ProviderAuth>((ref) => ProviderAuth());
final providerTts = ChangeNotifierProvider<ProviderTts>((ref) {
  final userProfile = ref.watch(providerUserProfile);
  return ProviderTts(userProfile);
});

//////////////////////////////////////////////////////////////////////////
// MAIN entry point to start app.
//////////////////////////////////////////////////////////////////////////
Future<void> main() async {
  // Initialize widgets and firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the default options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: 'Csc322');

  // Initialize the app directory
  await UtilFile.init();

  // Get references to providers that will be needed in other providers
  final ProviderUserProfile userProfileProvider = providerContainer.read(providerUserProfile);
  final ProviderAuth authProvider = providerContainer.read(providerAuth);

  // Initialize providers
  await userProfileProvider.initProviders(authProvider);
  authProvider.initProviders(userProfileProvider);

  // Run the app
  runApp(UncontrolledProviderScope(container: providerContainer, child: MyApp()));
}

//////////////////////////////////////////////////////////////////////////
// Main class which is the root of the app.
//////////////////////////////////////////////////////////////////////////
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//////////////////////////////////////////////////////////////////////////
// The actual STATE which is managed by the above widget.
//////////////////////////////////////////////////////////////////////////
class _MyAppState extends State<MyApp> {
  // The "instance variables" managed in this state
  // NONE

  // Router
  final GoRouter _router = GoRouter(
    initialLocation: ScreenLoginValidation.routeName,
    routes: [
      GoRoute(
        path: ScreenLoginValidation.routeName,
        builder: (context, state) => const ScreenLoginValidation(),
      ),
      GoRoute(
        path: ScreenSettings.routeName,
        builder: (context, state) => ScreenSettings(),
      ),
      GoRoute(
        path: ScreenProfileEdit.routeName,
        builder: (context, state) => const ScreenProfileEdit(),
      ),
      GoRoute(
        path: WidgetPrimaryScaffold.routeName,
        builder: (BuildContext context, GoRouterState state) => const WidgetPrimaryScaffold(),
      ),
      GoRoute(
        path: ScreenHome.routeName,
        builder: (BuildContext context, GoRouterState state) => ScreenHome(),
      ),
      GoRoute(
        path: ScreenAlternate.routeName,
        builder: (BuildContext context, GoRouterState state) => ScreenAlternate(),
      ),
    ],
  );

  //////////////////////////////////////////////////////////////////////////
  // Primary Flutter method overriden which describes the layout
  // and bindings for this widget.
  //////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'My App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
