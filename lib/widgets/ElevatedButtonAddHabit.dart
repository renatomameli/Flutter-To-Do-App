import 'package:flutter/material.dart';


class ElevatedButtonAddHabit extends StatelessWidget {
  ElevatedButtonAddHabit({
    Key? key,
    required this.createPage, required this.text,
  }) : super(key: key);

  final Widget createPage;
  final String text;

  final ButtonStyle style =
  ElevatedButton.styleFrom(
    shadowColor: Colors.black38,
    textStyle: const TextStyle(fontSize: 20),
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => createPage),
        );},
      child: Center(child: Text(text)));
  }
}
