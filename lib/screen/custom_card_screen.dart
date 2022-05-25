
import 'package:flutter/material.dart';
import 'package:flutter_widgets/text_style.dart';

import '../custom/custom_card_legacy.dart';

class CustomCardScreen extends StatefulWidget {
  const CustomCardScreen({Key? key}) : super(key: key);


  static const String routeName = "/custom_card_screen";

  @override
  _CustomCardScreenState createState() => _CustomCardScreenState();
}

class _CustomCardScreenState extends State<CustomCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'CustomCardScreen',
          style: kNotoSansMedium16.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomCardLegacy(
                title: '오늘 총 앉은시간',
                rightWidget: Text('abcde'),
              onInfoClick: () {},
            ),

          ],
        ),
      ),
    );
  }
}
