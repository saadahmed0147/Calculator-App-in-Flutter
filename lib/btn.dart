import 'package:calculator/color.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color color;
  final VoidCallback onPress;
  const MyButton(
      {Key? key,
      this.title = '0',
      this.titleColor = whiteColor,
      this.color = greyColor,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          height: 90,
          width: 90,
          child: Center(
              child: Text(
            title,
            style: TextStyle(color: titleColor, fontSize: 50),
          )),
        ),
      ),
    );
  }
}

class MyButton0 extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const MyButton0({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: greyColor,
              borderRadius: BorderRadius.circular(50)),
          height: 90,
          width: 220,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Text(
              title,
              style: const TextStyle(color: whiteColor, fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
