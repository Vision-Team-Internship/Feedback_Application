import 'package:flutter/material.dart';

class TextFieldText extends StatefulWidget {
  final String? Function(String?)? validator;
  final Function(String?) onChanged;
  final String? hinttext;
  final Widget? sufixIcon;
  final bool obscurText;
  final TextEditingController? controller;

  const TextFieldText({
    Key? key,
    required this.validator,
    required this.onChanged,
    this.hinttext,
    this.sufixIcon,
    required this.obscurText,
    this.controller,
  }) : super(key: key);
  @override
  _TextFieldTextState createState() => _TextFieldTextState();
}

class _TextFieldTextState extends State<TextFieldText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.obscurText,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
      decoration: InputDecoration(
        suffixIcon: widget.sufixIcon,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
        hintText: widget.hinttext,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
