import 'package:flutter/material.dart';

import '../HomeScreen/view/HomeScreen.dart';
import '../ProductScreen/view/ProductScreen.dart';
import '../SettingsScreen/view/SettingsScreen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;
  List<Widget> Screens = [HomeScreen(), ProductScreen(description: '', image: '', title: '', price: '', rating: '', brand: '',), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[selectedIndex],
    );
  }
}
