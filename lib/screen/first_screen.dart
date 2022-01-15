import 'package:flutter/material.dart';
import 'package:flutter_widgets/text_style.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FirstScreen',
          style: kNotoSansMedium16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
