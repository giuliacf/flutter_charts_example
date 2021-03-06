import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final double verticalSpace;
  final double horizontalSpace;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare = false,
    this.size = 16,
    this.textColor = Colors.white,
    this.verticalSpace = 2,
    this.horizontalSpace = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: verticalSpace,
        horizontal: horizontalSpace,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
