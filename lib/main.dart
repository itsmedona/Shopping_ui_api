import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/Screens/MyScreen/controller/MyScreenController.dart';
import 'presentation/Screens/NavigationScreen/NavigationScreen.dart';

void main() {
  runApp(const CartApp());
}

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) = MyScreenController(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: NavigationScreen(),
      ),
    );
  }
}
