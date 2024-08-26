import 'package:flutter/material.dart';
import 'cafe/BottomNavigationScreen.dart';
import 'cafe/CoffeeCard.dart';
import 'cafe/CoffeeCardCreateWidget.dart';
import 'cafe/Home.dart';
import 'cafe/wishlist/WishList.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const BottomNavigationScreen(), // 초기 페이지로 BottomNavigationScreen 설정
      routes: {
        "/home": (context) => const Home(),
        "/list": (context) => const CoffeeCard(
          imageUrl: '',
          name: '',
          description: '',
        ),
        "/wish": (context) => const WishList(),
        "/create": (context) => const CoffeeCardCreateWidget(),
      },
    );
  }
}
