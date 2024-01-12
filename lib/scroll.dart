import 'package:calculator/color.dart';
import 'package:flutter/material.dart';

class Scroll extends StatefulWidget {
  const Scroll({super.key});

  @override
  State<Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        backgroundColor: blackColor,
        body: const Row(
          children: [
            // Other widgets in the row
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  'Your long text goes here. Thisjkgjkgjkgjgggggggggggggggggggg text is scrollable within the Row.',
                  style: TextStyle(fontSize: 16.0, color: whiteColor),
                ),
              ),
            ),
            // Other widgets in the row
          ],
        ),
      ),
    );
  }
}
