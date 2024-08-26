import 'package:flutter/material.dart';

// CoffeeCardCreateWidget 클래스 정의
class CoffeeCardCreateWidget extends StatelessWidget {
  final String? initialText; // 초기 텍스트를 저장할 변수
  final Function(String?)? onSaved; // 텍스트 필드에서 입력된 값을 저장할 콜백 함수
  final String label; // 필드의 레이블을 정의

  const CoffeeCardCreateWidget({
    this.initialText,
    this.onSaved,
    this.label = '내용',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialText, // 초기 텍스트 설정
      decoration: InputDecoration(
        labelText: label, // 레이블 설정
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '이 필드는 비워둘 수 없습니다'; // 빈 입력에 대한 오류 메시지
        }
        return null; // 유효한 입력일 경우 null을 반환합니다.
      },
      onSaved: onSaved, // 입력 값이 저장될 때 호출될 콜백 함수 설정
    );
  }
}

// FormWidget 클래스 정의
class FormWidget extends StatefulWidget {
  final Function(String imageUrl, String name, String description)? onSubmit; // 데이터를 전달할 콜백 함수

  const FormWidget({this.onSubmit, super.key});

  @override
  FormStatus createState() => FormStatus(); // 상태를 관리하는 FormStatus를 생성합니다.
}

class FormStatus extends State<FormWidget> {
  String imageUrl = ''; // 이미지 URL을 저장할 변수
  String name = ''; // 커피 이름을 저장할 변수
  String description = ''; // 커피 설명을 저장할 변수
  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 관리하기 위한 키

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // 폼의 상태를 관리하는 키를 설정합니다.
      child: Column(
        children: [
          // 이미지 URL 입력 필드
          CoffeeCardCreateWidget(
            label: '이미지 URL',
            initialText: imageUrl,
            onSaved: (value) {
              imageUrl = value ?? ''; // 입력된 값을 imageUrl 변수에 저장합니다.
            },
          ),

          // 커피 이름 입력 필드
          CoffeeCardCreateWidget(
            label: '커피 이름',
            initialText: name,
            onSaved: (value) {
              name = value ?? ''; // 입력된 값을 name 변수에 저장합니다.
            },
          ),

          // 커피 설명 입력 필드
          CoffeeCardCreateWidget(
            label: '커피 설명',
            initialText: description,
            onSaved: (value) {
              description = value ?? ''; // 입력된 값을 description 변수에 저장합니다.
            },
          ),

          const SizedBox(height: 20), // 버튼과 입력 필드 사이에 여백을 추가합니다.

          // 제출 버튼
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) { // 폼이 유효한지 검사합니다.
                _formKey.currentState!.save(); // 폼의 데이터를 저장합니다.
                if (widget.onSubmit != null) {
                  widget.onSubmit!(imageUrl, name, description); // 데이터를 전달합니다.
                }
              }
            },
            child: const Text("등록"), // 버튼의 텍스트
          ),
        ],
      ),
    );
  }
}
