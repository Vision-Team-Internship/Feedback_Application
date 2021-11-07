import 'package:flutter/material.dart';

class TextFieldText extends StatefulWidget {
  final String text;
  final String? Function(String?)? validator;
  final Function(String?) onChanged;
  final String? hinttext;
  final Widget? sufixIcon;
  final bool obscurText;

  const TextFieldText({
    Key? key,
    required this.text,
    required this.validator,
    required this.onChanged,
    this.hinttext,
    this.sufixIcon,
    required this.obscurText,
  }) : super(key: key);
  @override
  _TextFieldTextState createState() => _TextFieldTextState();
}

class _TextFieldTextState extends State<TextFieldText> {
  final _textCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textCtrl,
      keyboardType: TextInputType.text,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.obscurText,
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
