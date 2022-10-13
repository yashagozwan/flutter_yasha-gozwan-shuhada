import 'package:flutter/material.dart';
import 'text_pro.dart';

class TextFormFieldPro extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String label;
  final double? bottom;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool obscureText;

  const TextFormFieldPro({
    super.key,
    this.controller,
    this.hint,
    required this.label,
    this.bottom,
    this.validator,
    this.textInputType,
    this.obscureText =  false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 16),
      margin: bottom != null ? EdgeInsets.only(bottom: bottom!) : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(10, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextPro(label),
          TextFormField(
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              contentPadding: EdgeInsets.zero,
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
