import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;

  const InputText({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  Color _colorTextLabel = Colors.grey;

  void _setColorLabel(bool focus) {
    if (focus) {
      _colorTextLabel = Colors.blue;
    } else {
      _colorTextLabel = Colors.grey;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) => _setColorLabel(value),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          labelText: widget.label,
          labelStyle: TextStyle(color: _colorTextLabel),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
