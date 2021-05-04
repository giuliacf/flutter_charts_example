import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

class ButtonAppBar extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onTap;

  ButtonAppBar({
    this.text,
    this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(iconData),
            ResponsiveVisibility(
              visible: false,
              visibleWhen: [Condition.largerThan(name: MOBILE)],
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
