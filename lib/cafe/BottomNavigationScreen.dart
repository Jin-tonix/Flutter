import 'package:flutter/material.dart';
import 'Home.dart';
import 'CoffeeCard.dart';
import 'wishlist/WishList.dart';
import 'CoffeeCardCreateWidget.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    const CoffeeCard(
      imageUrl: '',
      name: '',
      description: '',
    ),
    const WishList(),
    const CoffeeCardCreateWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color appBarColor = theme.colorScheme.inversePrimary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Coffee cards"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "리스트",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "즐겨찾기",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: "등록",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: appBarColor, // 하단 메뉴 바 배경색
        selectedItemColor: Colors.lightGreen, // 선택된 아이템의 색상
        unselectedItemColor: Colors.grey[400], // 선택되지 않은 아이템의 색상
      ),
    );
  }
}
