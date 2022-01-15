import 'package:flutter/material.dart';
import 'package:flutter_widgets/text_style.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({required this.update, Key? key}) : super(key: key);

  final bool update;

  static const String routeName = "/third_screen";

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ThirdScreen',
          style: kNotoSansMedium16.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Text(
                '${widget.update}',
                style: kNotoSansMedium16.copyWith(color: Colors.white),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
