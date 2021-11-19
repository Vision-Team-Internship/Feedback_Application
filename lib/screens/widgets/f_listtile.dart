// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:feedback_application_flutter/constants/theme_constant.dart';

class FListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String svgIcon;
  final VoidCallback onTap;

  const FListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.svgIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: SvgPicture.asset(
          svgIcon,
          color: Colors.black.withOpacity(.8),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          color: Color(0xff000000),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: ThemeConstant.textTheme.caption!.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}
