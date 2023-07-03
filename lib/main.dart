// ignore_for_file: unused_import

import 'package:explore_nearby/constants/routes.dart';
import 'package:explore_nearby/firebase_options.dart';
import 'package:explore_nearby/pages/favori_page.dart';
import 'package:explore_nearby/pages/events_page.dart';
import 'package:explore_nearby/pages/home_page.dart';
import 'package:explore_nearby/pages/conversations_page.dart';
import 'package:explore_nearby/pages/PlaceInfoPage.dart';
import 'package:explore_nearby/pages/map_page.dart';
import 'package:explore_nearby/pages/profile_page.dart';
import 'package:explore_nearby/pages/search_page.dart';
import 'package:explore_nearby/screens/home_screen.dart';
import 'package:explore_nearby/screens/register_screen.dart';
import 'package:explore_nearby/screens/splashscreen.dart';
import 'package:explore_nearby/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BasePage());
}

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: "explore_nearby",
        home: FirebaseAuth.instance.currentUser != null
            ? const HomeScreen()
            : const SplashScreen(),
        routes: {
          homepageRoute: (context) => const HomePage(),
          conversationspageRoute: (context) => const ConversationsPage(),
          mappageRoute: (context) => const MapPage(),
          searchpageRoute: (context) => const SearchPage(),
          favoripageRoute: (context) => const FavoriPage(),
          eventspageRoute: (context) => const EventsPage(),
          profilepageRoute: (context) => const ProfilePage(),
        });
  }
}
