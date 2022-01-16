import 'package:flutter/material.dart';
import 'package:flutter_widgets/main.dart';
import 'package:flutter_widgets/screen/third_screen.dart';
import 'package:flutter_widgets/text_style.dart';

class SecondScreen extends StatefulWidget {
  static String routeName = "/second_screen";

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SecondScreen',
          style: kNotoSansMedium16.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, ThirdScreen.routeName, ModalRoute.withName(SecondScreen.routeName), arguments: {"update": true});
              },
              child: Text(
                "GoTo ThirdScreen",
                style: kNotoSansMedium16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
