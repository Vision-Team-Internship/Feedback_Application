import 'package:flutter/material.dart';

import 'package:feedback_application_flutter/constants/theme_constant.dart';

class ButtonLogin extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ButtonLogin({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: ThemeConstant.textTheme.button!.copyWith(
          color: ThemeConstant.lightScheme.primary,
        ),
      ),
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            width: 1,
            color: ThemeConstant.lightScheme.primary,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.purple),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 18,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
