import 'package:flutter/material.dart';

import 'package:feedback_application_flutter/constants/theme_constant.dart';

class ButtonLogin extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color borderColor;

  final Color splashIcon;

  const ButtonLogin({
    Key? key,
    required this.title,
    required this.onTap,
    required this.borderColor,

    required this.splashIcon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: ThemeConstant.textTheme.button!.copyWith(
          color: borderColor,
        ),
      ),
      style: ButtonStyle(

        overlayColor: MaterialStateColor.resolveWith((states) => splashIcon),

        side: MaterialStateProperty.all(
          BorderSide(
            width: 1,
            color: borderColor,
          ),
        ),

        foregroundColor: MaterialStateProperty.all(Colors.purple),

        //  foregroundColor: MaterialStateProperty.all(Colors.purple),

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
