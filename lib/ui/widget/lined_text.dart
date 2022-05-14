import 'package:flutter/material.dart';

class LinedText extends StatelessWidget {
  final String text;
  final Color color;
  const LinedText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 1, // Space between underline and text
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: color,
        width: 1.0, // Underline thickness
      ))),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: color, fontSize: 16.0, height: 1
                //  decoration: TextDecoration.underline,
                ),
      ),
    );
  }
}
