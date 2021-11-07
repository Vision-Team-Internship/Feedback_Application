import 'package:flutter/material.dart';

import 'package:feedback_application_flutter/constants/theme_constant.dart';

class FTile extends StatelessWidget {
  final String title;
  final String floor;
  final String date;
  final String level;
  final Color? levelColor;

  const FTile({
    Key? key,
    required this.title,
    required this.floor,
    required this.date,
    required this.level,
    this.levelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: Colors.grey,
      onTap: () {
        // ignore: avoid_print
        print("Message");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 55,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: ThemeConstant.textTheme.headline6!.copyWith(
                    color: ThemeConstant.lightScheme.onBackground,
                  ),
                ),
                Expanded(
                  //   width: MediaQuery.of(context).size.width - 110,
                  child: Text(
                    "F1>IT>201 \tupdated: 02/ 11/ 2021",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeConstant.textTheme.bodyText2!.copyWith(
                      color: ThemeConstant.lightScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    level,
                    style: ThemeConstant.textTheme.bodyText1!.copyWith(
                      color: levelColor,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: ThemeConstant.lightScheme.secondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
