import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelScreen extends StatefulWidget {
  _MethodChannelState createState() => _MethodChannelState();
}

class _MethodChannelState extends State<MethodChannelScreen> {
  static const platform = const MethodChannel('com.seosh817/value');
  String _value = 'null';

  Future<void> _getNativeValue() async {
    String value;
    try {
      value = await platform.invokeMethod('getValue');
    } on PlatformException catch (e) {
      value = '네이티브 코드 실행 에러 : ${e.message}';
    }

    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MethodChannel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_value'),
            ElevatedButton(onPressed: () {
              _getNativeValue();
            }, child: Text('네이티브 값 얻기')
            )],
        ),
      ),
    );
  }
}