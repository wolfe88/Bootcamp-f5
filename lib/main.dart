import 'package:explore_nearby/constants/routes.dart';
import 'package:explore_nearby/pages/map_page.dart';
import 'package:explore_nearby/pages/events_page.dart';
import 'package:explore_nearby/pages/home_page.dart';
import 'package:explore_nearby/pages/conversations_page.dart';
import 'package:explore_nearby/pages/profile_page.dart';
import 'package:explore_nearby/screens/home_screen.dart';
import 'package:explore_nearby/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(BasePage());

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
        home: const HomeScreen(), //child appbar
        routes: {
          homepageRoute: (context) => const HomePage(),
          conversationspageRoute: (context) => const ConversationsPage(),
          mappageRoute: (context) => const MapPage(),
          eventspageRoute: (context) => const EventsPage(),
          profilepageRoute: (context) => const ProfilePage(),
        });
  }
}
