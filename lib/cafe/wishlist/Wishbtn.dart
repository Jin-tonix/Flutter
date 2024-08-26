import 'package:flutter/material.dart';

class WishBtn extends StatefulWidget {
  final VoidCallback? onPressed; // 콜백 추가

  const WishBtn({super.key, this.onPressed}); // 생성자에서 콜백을 받을 수 있게 수정

  @override
  _WishBtnState createState() => _WishBtnState(); // StatefulWidget의 상태를 관리할 State 객체를 생성
}

class _WishBtnState extends State<WishBtn> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavorited = !_isFavorited;
        });
        if (widget.onPressed != null) {
          widget.onPressed!(); // 콜백 호출
        }
      },
      icon: Icon(
        Icons.favorite,
        color: _isFavorited ? Colors.red : Colors.grey,
      ),
    );
  }
}
