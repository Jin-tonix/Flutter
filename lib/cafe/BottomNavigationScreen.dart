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
    FormWidget( // FormWidget을 포함하여 수정
      onSubmit: (imageUrl, name, description) {
        // 데이터 제출 처리
        print('Image URL: $imageUrl');
        print('Name: $name');
        print('Description: $description');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Coffee cards"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen, // BottomNavigationBar의 배경 색상 설정
        selectedItemColor: Colors.white, // 선택된 아이템의 색상 설정
        unselectedItemColor: Colors.black54, // 선택되지 않은 아이템의 색상 설정
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
      ),
    );
  }
}
