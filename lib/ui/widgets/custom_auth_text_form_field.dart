import 'package:class_f_story/_core/constants/size.dart';
import 'package:flutter/material.dart';

class CustomAuthTextFormField extends StatelessWidget {
  final String text;
  final bool obscureText;
  final TextEditingController controller;

  const CustomAuthTextFormField({
    required this.text,
    this.obscureText = false,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        const SizedBox(height: smallGap),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: 'Enter $text',
              hintStyle: TextStyle(color: Colors.grey),
              // 기본 TextFormField 디자인을 설정한다.
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // 터치 시 활성화된 디자인 설정
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // 유효성 검사 실패 시 사용되는 디자인 설정
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // 에러 발생 후 터치 시 사용되는 디자인 설정
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              )),
        ),
      ],
    );
  }
}
